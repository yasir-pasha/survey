<?php
  
  use Illuminate\Database\Migrations\Migration;
  use Illuminate\Database\Schema\Blueprint;
  use Illuminate\Support\Facades\Schema;
  
  class CreateSurveyQuestionsTable extends Migration
  {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::create('survey_questions', function (Blueprint $table) {
        $table->id();
        $table->bigInteger('survey_id', false, true)->nullable(false);
        $table->string('field_type', 10)->nullable(false);
        $table->string('question', 255)->nullable(false);
        $table->text('options')->nullable(true);
        $table->timestamps();
        $table->foreign('survey_id')->references('id')->on('surveys')->onDelete('CASCADE')->onUpdate('no action');
      });
    }
    
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
      Schema::dropIfExists('survey_questions');
    }
  }
