# REST API

```
@ version: 1.1
```

|----+--------+-----------------------------------------------------------------+----------------------------------------------|
|    | method | url                                                             | description                                  |
|----+:------:+-----------------------------------------------------------------+----------------------------------------------|
| 1  |  POST  | /task                                                           | create a new download task                   |
| 2  |   PUT  | /task/tid/<tid>?act=pause                                       | pause a task with its tid                    |
| 3  |   PUT  | /task/tid/<tid>?act=resume                                      | resume download                              |
| 4  | DELETE | /task/tid/<tid>?del_file=true                                   | delete a task and its data                   |
| 5  | DELETE | /task/tid/<tid>                                                 | delete a task and keep data                  |
| 6  |   GET  | /task/tid/<tid>/status                                          | get the full status of a task                |
| 7  |   GET  | /task/tid/<tid>/status?exerpt=true                              | get the status exerpt of a task              |
| 8  |   GET  | /task/tid/<tid>/info                                            | get the task info                            |
| 9  |  POST  | /task/batch/pause                                               | post a list of tasks' tid to be paused       |
| 10 |  POST  | /task/batch/resume                                              | post a list of tasks' tid to be resumed      |
| 12 |  POST  | /task/batch/delete                                              | post a list of tasks' tid to be deleted      |
| 13 |   GET  | /task/list                                                      | get task list exerpt                         |
| 14 |   GET  | /task/list?exerpt=false                                         | get task list                                |
| 15 |   GET  | /task/list?state={all|downloading|finished|paused}              | get task list exerpt according to the state  |
| 16 |   GET  | /task/list?exerpt=false&state={all|downloading|finished|paused} | get task list according to the state         |
| 17 |   GET  | /task/state_coutner                                             | get number of tasks in each state            |
| 18 |   GET  | /config                                                         | get the server's configuration               |
|----+--------+-----------------------------------------------------------------+----------------------------------------------|

Note:

Server always replies json formated data to browser in which field 'status' must be contained to indicate
that if the previous operation is successful or not.

Valid values for field 'status' are 'success' and 'error'.

When 'error' status occurs, another filed 'errmsg' is included to points out what happened.




