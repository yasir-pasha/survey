@if(isset($view))
    <p class="text-info">
        {{isset($answers[$question->id])?$answers[$question->id]->answer:'N/A'}}
    </p>
@else
    <input class="form-control" type="text" name="question_id[{{$data->id}}]" value="{{isset($answers[$question->id])?$answers[$question->id]->answer:''}}">
@endif