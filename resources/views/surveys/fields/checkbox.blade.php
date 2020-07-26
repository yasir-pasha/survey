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
        $id=[];
        if(isset($answers[$question->id])){
           $id = json_decode($answers[$question->id]->answer);
        }
    @endphp
    @forelse($options->values as $option)

        <div class="form-check">
            <input class="form-check-input" type="checkbox"  name="question_id[{{$data->id}}][]"
                   id="option-{{$option->id}}"
                   value="{{$option->id}}" {{in_array($option->id,$id)?'checked':''}}>
            <label class="form-check-label" for="option-{{$option->id}}">{{$option->value}}</label>
        </div>
    @empty
    @endforelse
@endif
