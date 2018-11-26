package com.dao.onlinebank;

public class PasswordEncrytion {


	static String Password;

	//Encrypt the Password 
	public static String Encrypt(String password) {
		char ch[]=password.toCharArray();
		String encrypt="";
		for(int i=0;i<password.length()-1;i=i+2)
		{
			char temp=ch[i];
			ch[i]=ch[i+1];
			ch[i+1]=temp;
		}
		for (int i = 0; i < password.length(); i=i+1) {
			System.out.println(ch[i]);
			encrypt=encrypt+ch[i];
		}
		System.out.println("Encrypted:"+encrypt);
		return "#$!sew^@"+encrypt+"%4!@";

	}

	//Decrypt the Password
	public static String Decrypt(String password) {
		char ch[]=password.toCharArray();
		String decrypt="";
		for(int i=0;i<password.length()-1;i=i+2)
		{
			char temp=ch[i];
			ch[i]=ch[i+1];
			ch[i+1]=temp;
		}
		for (int i = 0; i < password.length(); i=i+1) {
			System.out.println(ch[i]);
			decrypt=decrypt+ch[i];
		}
		System.out.println("Decrypted:"+decrypt);
		return "#$!sew^@"+decrypt+"%4!@";

	}
	/*public static void main(String[] args) {
		Scanner in=new Scanner(System.in);
		System.out.println("Enter password :");
		Password=in.next();
		System.out.println("Decrypted :"+Password);

		String check=Encrypt(Password);
		System.out.println("Encrypted Check :   "+check);
		System.out.println("Decrypt Check : "+Decrypt(check));
	 */	





}
