@if(isset($view))
    <p class="text-info">
        @if(isset($answers[$question->id]))
            @php
                $id = $answers[$question->id]->answer;
                $options = json_decode($data->options);
$options = collect($options->values);
$options = $options->keyBy('id');

            @endphp
            {{$options[$id]->value}}
        @else
            N/A
        @endif
    </p>
@else
    @php
        $options = json_decode($data->options);
    @endphp
    <select id="inputState" class="form-control" name="question_id[{{$data->id}}]">
        <option value="">Choose {{$data->question}}</option>
        @forelse($options->values as $option)

            <option value="{{$option->id}}">{{$option->value}}</option>
        @empty
        @endforelse
    </select>
@endif