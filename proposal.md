Name: Remus Tumac           ID:   46817892

## Proposed Project

My idea is based on the Six Degrees of Kevin Bacon game. I am planning 
to construct a web application that allows users to search the degree
of separation between two actors. I will use the IMDB API in order to
get movies and its cast. I will use that data to construct a graph which
will be displayed with the help of a phoenix web application.
<br>
I will also implement an algorithm to search the most 'connected' node 
in the graph. Essentially, I will try to answer the question is Kevin
Bacon six degrees away from every actor? Also, is there any other actor
that maybe is 5 degrees away from any other actor? Even after parallelization 
and optimization, this sort of exhaustive search may be very computational 
expensive. If sufficient computational power is not available, I will run
the algorithm on a smaller graph.  


## Outline Structure

I will split the code in multiple modules: a module to search the shortest 
path between two nodes, a module to search the most connected node in the
graph, a module to interact with the IMDB API, and modules to handle the user
interface. I am planning to use the phoenix framework. For the search algorithm
there will be a supervisor process which will be in charge of creating new
processes and delegating the work. The supervisor process would also be in
charge of combining the results once the worker process finish executing.
