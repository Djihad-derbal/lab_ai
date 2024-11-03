task(TaskID, Description, Assignee, CompletionStatus).
task(1,'fix the home scrren bug',omar,not_completed).
task(2,'copmlete the homepage ui design',ali,completed).
task(3,'add login auth',mohamed,not_completed).


create_task(TaskID,Description,Assign):- assertz(task(TaskID, Description, Assign, not_completed)).

assign_task(TaskID, Assignee) :-
    retract(task(TaskID, Description, _, CompletionStatus)),  % Remove the existing task with old assign
    assertz(task(TaskID, Description, Assignee, CompletionStatus)).

mark_completed(TaskID) :-
    retract(task(TaskID, Description, Assignee, not_completed)),  % Remove task with not_completed status
    assertz(task(TaskID, Description, Assignee, completed)).  % Add task with completed status

display_all_tasks :-
    task(TaskID, Description, Assignee, CompletionStatus),
    format("Task ID: ~w, Description: ~w, Assignee: ~w, Status: ~w", [TaskID, Description, Assignee, CompletionStatus]).

display_tasks_by_user(Assignee) :-
    task(TaskID, Description, Assignee, CompletionStatus),
    format("Task ID: ~w, Description: ~w, Assignee: ~w, Status: ~w~n", [TaskID, Description, Assignee, CompletionStatus]).

display_completed_tasks :-
    task(TaskID, Description, Assignee, completed),
    format("Task ID: ~w, Description: ~w, Assignee: ~w, Status: completed~n", [TaskID, Description, Assignee]).

display_incomplete_tasks :-
    task(TaskID, Description, Assignee, not_completed),
    format("Task ID: ~w, Description: ~w, Assignee: ~w, Status: not_completed~n", [TaskID, Description, Assignee]).





