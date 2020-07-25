<?php
  
  namespace App;
  
  use Illuminate\Database\Eloquent\Model;
  
  class SurveyInstance extends Model
  {
    public function answers()
    {
      return $this->hasMany(SurveyAnswer::class);
      
    }
  }
