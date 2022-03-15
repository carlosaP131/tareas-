package principal;

public class Principal {
	public static void main(String args[]) {
		// primitivos
		int numero;
		float numero2;
		byte numero3;
		short numero4;
		long numero5;
		double numero6;
		boolean numero7;
		char letra;
		numero = 234;
		numero2 = (float) 34.5;
		numero3 = -34;
		numero4 = (short) -32.5;
		numero5 = -2;
		numero6 = 10.0;
		numero7 = false;
		letra = 65;
		System.out.println(" ****************************************************************************************");
		System.out
				.println(" *tipo     *     tamaño   *                   rango                     *    ejemplo    * ");
		System.out.println(" ****************************************************************************************");
		System.out.println(
				" *entero   *     32 bits  *         -2147483648  a 2147483647           * " + numero + "           *");
		System.out.println(" ****************************************************************************************");
		System.out.println(
				" *float    *     32 bits  *         -3.402823e38 a 3.402823e38          * " + numero2 + "          *");
		System.out.println(" ****************************************************************************************");
		System.out.println(
				" *byte     *      8 bits  *                 -128 a 127                  *" + numero3 + "            *");
		System.out.println(" ****************************************************************************************");
		System.out.println(
				" *short    *     16 bits  *               -32768 a 32767                *" + numero4 + "            *");
		System.out.println(" ****************************************************************************************");
		System.out.println(
				" *long     *     64 bits  * -9223372036854775808 a 9223372036854775807  *" + numero5 + "             *");
		System.out.println(" ****************************************************************************************");
		System.out.println(
				" *double   *     64 bits  *-1.79769313486232e308 a 1.79769313486232e308 * " + numero6 + "          *");
		System.out.println(" ****************************************************************************************");
		System.out.println(
				" *boolean  *      1 bit   *                false - true                 * " + numero7 + "         *");
		System.out.println(" ****************************************************************************************");
		System.out.println(
				" *char     *     16 bits  *            '\\u0000' - '\\uffff'            *" + letra + "                *");
		System.out.println(" ****************************************************************************************");
	}

}
