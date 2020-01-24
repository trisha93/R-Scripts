library(tibble)
my_timer <- function()
  {
  start_time = 0
  finish_time = 0
  name = 'unknown'
  duration = 0
  df = tibble(Name = character(), Start = character(), Finish = character(), Duration = character())
  
  archive <- function() {
    df <<- df %>% add_row(name = name, Start = as.character(start_time), Finish = as.character(finish_time), Duration = duration)
  }
  list(start = function(name = 'unknown'){
  start_time <<- Sys.time()
  },

  finish <- function(){
  finish_time <<- Sys.time()
  archive()
},

     

summary <- function(){
  summary <- list(name = name, Start = start_time, Finish = finish_time)
  summary
},

get_time <- function(){
  duration <<- round(finish_time - start_time)
 duration
},

get_all_time <- function(){
  df
},
)
}
t <- my_timer()
str(t)

#calling start()

t$start("Person1")
Sys.sleep(3)
t$finish()

#calling get_time()
t$get_time()

#calling summary()
(t$summary())

#start() and finish() for second timing event
t$start("Person2")
Sys.sleep(2)
t$finish()

#confirming result by calling get_time() and summary()
t$get_time()
(t$summary())

#displaying full set of results
(t$get_all_time())
