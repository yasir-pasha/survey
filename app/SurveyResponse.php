<?php
  
  namespace App;
  
  use Illuminate\Database\Eloquent\Model;
  
  class SurveyResponse extends Model
  {
    public function answers()
    {
      return $this->hasMany(SurveyAnswer::class);
      
    }
  }
