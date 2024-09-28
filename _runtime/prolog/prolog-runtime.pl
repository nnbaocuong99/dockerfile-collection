:- initialization(main).

main :-
    writeln('Prolog Runtime Environment'),
    current_prolog_flag(version, Version),
    format('Prolog version: ~w~n', [Version]),
    working_directory(CWD, CWD),
    format('Current working directory: ~w~n', [CWD]),
    current_prolog_flag(arch, Arch),
    format('Architecture: ~w~n', [Arch]),
    get_time(StartTime),
    
    % Add your application logic here
    % For example:
    % consult('app.pl'),
    % start_app,
    
    get_time(EndTime),
    ExecutionTime is EndTime - StartTime,
    format('Execution time: ~3f seconds~n', [ExecutionTime]).

% To run: swipl -s runtime.pl
