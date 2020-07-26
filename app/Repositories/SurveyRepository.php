<?php
  
  
  namespace App\Repositories;
  
  
  use App\Survey;
  use App\SurveyAnswer;
  use App\SurveyInstance;
  use Illuminate\Http\Request;
  use Illuminate\Support\Facades\Auth;
  
  class SurveyRepository
  {
    
    public function getAll(int $user_id)
    {
      return Survey::orderBy('created_at', 'DESC')
        ->leftJoin('survey_instances', function ($join) use ($user_id) {
          $join->on('survey_instances.survey_id', '=', 'surveys.id')
            ->where('survey_instances.user_id', '=',$user_id);
        })
        ->selectRaw('surveys.*,CASE when survey_instances.status is null then 0 else survey_instances.status end as status')
        ->paginate(25);
    }
    
    public function findById(int $id)
    {
      return Survey::findOrFail($id);
    }
    
    public function submitSurvey(Request $request, $user_id)
    {
      $answers                = $request->get('question_id');
      $answers                = array_filter($answers);
      $survey_id              = $request->get('survey_id');
      $survey                 = $this->findById($survey_id);
      $total_survey_questions = $survey->questions->count();
      
      if ($request->has('submit')) {
        if ($total_survey_questions !== count($answers)) {
          throw new \Exception('Please answer all the questions to submit.');
        }
      }
      $survey_instance_id = $this->saveSurveyResponse($user_id, $request->get('survey_id'));
      $total_answer_saved = $this->saveAnswers($survey_instance_id, $answers);
      $status             = $this->updateSurveyStatus($survey_instance_id, $total_survey_questions, $total_answer_saved);
      return $status;
    }
    
    private function saveSurveyResponse(int $user_id, int $survey_id)
    {
      $is_exist = $this->getSurveyResponse($user_id, $survey_id);
      if (!is_null($is_exist)) {
        return $is_exist->id;
      } else {
        $survey_response            = new SurveyInstance();
        $survey_response->user_id   = $user_id;
        $survey_response->survey_id = $survey_id;
        $survey_response->save();
        return $survey_response->id;
      }
    }
    
    private function getSurveyResponse(int $user_id, int $survey_id)
    {
      return SurveyInstance::whereUserId($user_id)->whereSurveyId($survey_id)->first();
    }
    
    private function saveAnswers(int $survey_instance_id, array $answers)
    {
      if (count($answers) > 0) {
        foreach ($answers as $id => $answer) {
          
          if (is_array($answer)) {
            $answer = json_encode($answer);
          }
          
          $data      = [
            'answer' => $answer
          ];
          $attribute = [
            'survey_instance_id' => $survey_instance_id,
            'question_id'        => $id,
          ];
          SurveyAnswer::updateOrCreate($attribute, $data);
          
        }
        
      }
      return count($answers);
    }
    
    private function updateSurveyStatus(int $survey_instance_id, int $total_survey_questions, int $total_answer_saved)
    {
      if ($total_answer_saved === 0) {
        $status = 0;
      } elseif ($total_answer_saved > 0) {
        if ($total_answer_saved === $total_survey_questions) {
          $status = 2;
        } else {
          $status = 1;
        }
      }
      
      $survey_response         = SurveyInstance::findOrFail($survey_instance_id);
      $survey_response->status = $status;
      $survey_response->save();
      
      return true;
    }
  
    public function surveyResponseByUser(int $user_id, int $id)
    {
      return SurveyInstance::whereUserId($user_id)->whereSurveyId($id)->first();
    }
  }