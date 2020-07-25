<?php
  
  use Illuminate\Database\Migrations\Migration;
  use Illuminate\Database\Schema\Blueprint;
  use Illuminate\Support\Facades\Schema;
  
  class AddColumnSurveyResponseIdToSurveyAnswers extends Migration
  {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::table('survey_answers', function (Blueprint $table) {
        $table->dropForeign('survey_answers_user_id_foreign');
        $table->dropColumn('user_id');
        $table->unsignedBigInteger('survey_response_id')->nullable(false)->after('id');
        $table->foreign('survey_response_id')->references('id')->on('survey_responses');
      });
    }
    
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
      Schema::table('survey_answers', function (Blueprint $table) {
        //
      });
    }
  }
