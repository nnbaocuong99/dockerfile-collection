% RUNTIME file for Erlang

-module(runtime_app).
-export([main/0]).

main() ->
    % Set environment variables
    putenv("APP_ENV", "production"),

    % Main application logic
    io:format("Erlang Runtime Environment~n"),
    io:format("Erlang version: ~p~n", [erlang:system_info(otp_release)]),
    io:format("Current working directory: ~p~n", [file:get_cwd()]),

    % Add your application logic here
    % For example:
    % my_app:run().
    ok.
