<?php
  
  namespace App;
  
  use Illuminate\Database\Eloquent\Model;
  
  class SurveyAnswer extends Model
  {
    protected $fillable = ['survey_response_id', 'question_id', 'answer', 'created_at', 'updated_at'];
  }
