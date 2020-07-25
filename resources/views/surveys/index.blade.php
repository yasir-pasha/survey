@extends('layouts.app')

@section('content')

    <div class="col-md-12">
        <div class="card">
            <div class="card-header">{{ __('Surveys') }}</div>

            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Survey Name</th>
                        <th scope="col">Survey Description</th>
                        <th scope="col">Creation Date</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    @forelse($surveys as $survey)
                        <tr>
                            <th scope="row">{{$survey->id}}</th>
                            <td>{{$survey->name}}</td>
                            <td>{{$survey->description}}</td>
                            <td>{{\Carbon\Carbon::parse($survey->created_at)->format('d-m-Y')}}</td>
                            <td>{{config('constants.SURVEY_STATUS.'.$survey->status)}}</td>
                            <td>
                                @if($survey->status !== 2)
                                    <a href="{{route('surveys.fill',$survey->id)}}" class="btn-link">Fill</a>
                                @endif
                                @if($survey->status === 2)
                                    <a href="{{route('surveys.view',$survey->id)}}" class="btn-link">View</a>

                                @endif
                            </td>

                        </tr>
                    @empty
                        <tr>
                            <td colspan="6" class="text-center">No Survey found</td>
                        </tr>
                    @endforelse
                    </tbody>
                </table>

            </div>
        </div>
    </div>

@endsection