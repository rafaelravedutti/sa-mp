stock md5(string[])
{
	new sg[256];
	sg = MD5_Hash(string);
	for(new c; c<sizeof sg; c++) tolower(sg[c]);
	return sg;
}
