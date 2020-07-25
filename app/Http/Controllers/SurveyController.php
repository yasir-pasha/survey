<?php
  
  namespace App\Http\Controllers;
  
  use App\Exceptions\ErrorException;
  use App\Repositories\SurveyRepository;
  use Illuminate\Http\Request;
  use Illuminate\Support\Facades\Auth;
  use Illuminate\Support\Facades\DB;
  
  class SurveyController extends Controller
  {
    /**
     * @var SurveyRepository
     */
    private $survey;
    
    public function __construct(SurveyRepository $survey)
    {
      parent::__construct();
      $this->survey = $survey;
    }
    
    public function index()
    {
      $surveys = $this->survey->getAll($this->user_id);
      return view('surveys.index', compact('surveys'));
    }
    
    public function fill(int $id)
    {
      $survey = $this->survey->findById($id);
      return view('surveys.fill', compact('survey'));
    }
    
    public function view(int $id)
    {
      $survey           = $this->survey->findById($id);
      $questions = $survey->questions;
      $survey_response  = $this->survey->surveyResponseByUser($this->user_id, $id);
      $answers   = $survey_response->answers->keyBy('question_id');
      return view('surveys.view', compact('survey', 'survey_response', 'answers','questions'));
    }
    
    public function submit(Request $request)
    {
      try {
        DB::beginTransaction();
        $status = $this->survey->submitSurvey($request, $this->user_id);
        DB::commit();
        return redirect()->route('surveys.surveys')->with('success', 'Survey saved successfully!');
      } catch (\Exception $e) {
        DB::rollBack();
        throw new ErrorException($e->getMessage());
      }
    }
  }
