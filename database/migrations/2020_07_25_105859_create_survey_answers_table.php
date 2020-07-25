<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSurveyAnswersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('survey_answers', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable(false);
            $table->unsignedBigInteger('question_id')->nullable(false);
            $table->string('answer',255)->nullable(false);
            $table->foreign('user_id')->on('users')->references('id')->onDelete('CASCADE')->onUpdate('no action');
            $table->foreign('question_id')->on('survey_questions')->references('id')->onDelete('CASCADE')->onUpdate('no action');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('survey_answers');
    }
}
