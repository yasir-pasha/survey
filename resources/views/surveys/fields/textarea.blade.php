@if(isset($view))
    <p class="text-info">
        {{isset($answers[$question->id])?$answers[$question->id]->answer:'N/A'}}
    </p>
@else
    <textarea class="form-control" type="text" name="question_id[{{$data->id}}]"></textarea>
@endif