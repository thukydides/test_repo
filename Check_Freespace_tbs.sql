

 accept tbsname format A50 prompt "Enter tablespace name: ";

 select tablespace_name,file_id,sum(blocks) as "Free space in blocks", sum(bytes)/1024/1024 as "Free space in Megabytes"
 from dba_free_space where tablespace_name = '&tbsname' group by tablespace_name, file_id;
 
 select file_name,file_id,bytes, maxbytes,status, autoextensible, online_status 
from dba_data_files where tablespace_name = '&tbsname';
