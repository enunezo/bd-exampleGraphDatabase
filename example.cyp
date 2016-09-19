CREATE (TheMatrix:Movie {title:'The Matrix', released:1999, tagline:'Welcome to the Real World'})


CREATE (Keanu:Person {name:'Keanu Reeves', born:1964})
CREATE (Carrie:Person {name:'Carrie-Anne Moss', born:1967})
CREATE (Laurence:Person {name:'Laurence Fishburne', born:1961})
CREATE (Hugo:Person {name:'Hugo Weaving', born:1960})
CREATE (AndyW:Person {name:'Andy Wachowski', born:1967})
CREATE (LanaW:Person {name:'Lana Wachowski', born:1965})
CREATE (JoelS:Person {name:'Joel Silver', born:1952})
CREATE
  (Keanu)-[:ACTED_IN {roles:['Neo']}]->(TheMatrix),
  (Carrie)-[:ACTED_IN {roles:['Trinity']}]->(TheMatrix),
  (Laurence)-[:ACTED_IN {roles:['Morpheus']}]->(TheMatrix),
  (Hugo)-[:ACTED_IN {roles:['Agent Smith']}]->(TheMatrix),
  (AndyW)-[:DIRECTED]->(TheMatrix),
  (LanaW)-[:DIRECTED]->(TheMatrix),
  (JoelS)-[:PRODUCED]->(TheMatrix)


//Existe un actor llamado Keanu Reeves
MATCH (actor {name: "Keanu Reeves"}) RETURN actor  

//En que peliculas ha actuado Keanu Reeves
MATCH (n {name: "Keanu Reeves"})-[:ACTS_IN]->(d) RETURN n, COUNT(d)


//Todos los actores de una pelicula
MATCH (m:Movie {title:"The Matrix"})
 

//Listado de las películas filmadas en 2008.
MATCH (nineties:Movie) WHERE nineties.released = 2008 RETURN nineties.title

//Listado de todas las películas y sus actores

MATCH (m:Movie)(movie)
RETURN movie.title, collect(actor.name), 
count(*) as count 
ORDER BY count desc;
