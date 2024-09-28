:- initialization(run_tests).

:- begin_tests(example).

test(addition) :-
    Result is 2 + 2,
    assertion(Result == 4).

test(string_concatenation) :-
    string_concat("Hello, ", "World!", Result),
    assertion(Result == "Hello, World!").

test(list_operations) :-
    List = [1, 2, 3],
    length(List, Length),
    assertion(Length == 3),
    member(2, List).

:- end_tests(example).

run_tests :-
    writeln('Running Prolog tests...'),
    run_tests(example),
    test_results(Total, Passed, Failed),
    format('Tests run: ~w~n', [Total]),
    format('Tests passed: ~w~n', [Passed]),
    format('Tests failed: ~w~n', [Failed]).

test_results(Total, Passed, Failed) :-
    aggregate_all(count, test_result(_,_), Total),
    aggregate_all(count, test_result(_,passed), Passed),
    Failed is Total - Passed.

% To run: swipl -s testscript.pl
