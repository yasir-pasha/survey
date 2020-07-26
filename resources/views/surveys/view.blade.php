@extends('layouts.app')

@section('content')

    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h4 class="float-left">{{$survey->name }}</h4>
                <div class="float-right"><b>Completed Date:</b> {{\Carbon\Carbon::parse($survey_interest->updated_at)->format('d-m-Y h:i A') }}</div>
            </div>


            <div class="card-body">
                <div>
                    @forelse($questions as $question)
                        <div class="form-group">
                            <label class="question_text" data-question_id="{{$question->id}}"
                                   data-question_type="{{$question->field_type}}"
                                   data-is_required="0">{{$question->question}}:</label>

                            @include('surveys.fields.'.$question->field_type,['data'=>$question,'answers'=>$answers,'view'=>true])
                        </div>
                    @empty
                        <div class="col-md-12">
                            <p>No Question found!</p>
                        </div>
                    @endforelse
                </div>
            </div>
        </div>
    </div>

@endsection