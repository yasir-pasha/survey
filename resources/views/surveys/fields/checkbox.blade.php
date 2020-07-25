@if(isset($view))
    <p class="text-info">
        @if(isset($answers[$question->id]))
            @php
                $id = $answers[$question->id]->answer;
                $ids = json_decode($id);
                $options = json_decode($data->options);
                $options = collect($options->values);
                $options = $options->keyBy('id');
                $values = [];
                foreach ($ids as $id){
                  $values[] = $options[$id]->value;
                }
            @endphp
            {{implode(', ',$values)}}
        @else
            N/A
        @endif
    </p>
@else
    @php
        $options = json_decode($data->options);
    @endphp
    @forelse($options->values as $option)

        <div class="form-check">
            <input class="form-check-input" type="checkbox" name="question_id[{{$data->id}}][]"
                   id="{{$data->id}}"
                   value="{{$option->id}}">
            <label class="form-check-label" for="inlineRadio1">{{$option->value}}</label>
        </div>
    @empty
    @endforelse
@endif
