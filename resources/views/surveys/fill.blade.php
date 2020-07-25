@extends('layouts.app')

@section('content')

    <div class="col-md-12">
        <div class="card">
            <div class="card-header">{{ __('Fill Survey').' - '. $survey->name }}</div>

            <div class="card-body">
                <form id="survey_form" action="{{route('surveys.submit')}}" method="post">
                    <input type="hidden" id="action" name="action" value="add_survey_response">
                    <input type="hidden" id="survey_id" name="survey_id" value="{{$survey->id}}">
                    {!! csrf_field() !!}
                    <div>
                        @forelse($survey->questions as $question)
                            <div class="form-group">
                                <label class="question_text" data-question_id="{{$question->id}}"
                                       data-question_type="{{$question->field_type}}"
                                       data-is_required="0">{{$question->question}}:</label>

                                @include('surveys.fields.'.$question->field_type,['data'=>$question])
                            </div>
                        @empty
                            <div class="col-md-12">
                                <p>No Question found!</p>
                            </div>
                        @endforelse
                        <div class="submit_button">

                            <button id="submitButton" name="submit"
                                    class="btn btn-primary float-right"
                                    role="button" aria-disabled="false" value="submit"><span
                                        class="ui-button-text">Submit</span>
                            </button>
                            <button style="margin-right: 5px" id="save" name="save"
                                    class="btn btn-primary float-right"
                                    role="button" aria-disabled="false" value="save-work"><span
                                        class="ui-button-text">Save Work</span>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

@endsection