BEGIN{
	FS=",";
}
{
	read_date=$1;
	gsub("-","",read_date);
	read_name=$2;
	print("holiday."read_date".date="read_date"\nholiday."read_date".name="read_name);
}

