/*1. В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.*/
 
-- все 3 задания набрасывал и корректировал с решением, т.к. не ставил на пк клиенты субд
 
HSET addresses '127.0.0.1' 0
HINCRBY addresses '127.0.0.1' 1
 
