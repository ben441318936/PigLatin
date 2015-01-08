import java.util.*;

public void setup() {
	String lines[] = loadStrings("words.txt");
	//System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
	String HymnLines[] = loadStrings("LowellHymn.txt");
	ArrayList <String[]> HymnWords=new ArrayList <String[]> ();
	for(int i = 0; i < HymnLines.length; i++)
	{
		HymnWords.add(String.split(HymnLines[i],' '));
	}
	println(HymnWords);
}
public void draw()
{
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	for(int i=0;i<sWord.length();i++)
    {
      if(sWord.charAt(i)=='a' || sWord.charAt(i)=='e' || sWord.charAt(i)=='i' || sWord.charAt(i)=='o' || sWord.charAt(i)=='u')
      {
        return i;
      }
    }
	return -1;
} 
public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if(sWord.equals(" ") || sWord.equals(".") || sWord.equals(",") || sWord.equals("!"))
	{
		return sWord;
	}
	else if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}
	else if(findFirstVowel(sWord) == 0)
	{
		return sWord + "way";
	}
	else if(sWord.length()>=2)
	{
		if(sWord.charAt(0)=='q' || sWord.charAt(1)=='u')
		{
			String temp = sWord.substring(2,sWord.length()-1);
			return temp + "qu" + "ay";
		}
		else if(findFirstVowel(sWord)>0)
		{
			String temp = sWord.substring(findFirstVowel(sWord),sWord.length()) + sWord.substring(0,findFirstVowel(sWord));
			return temp + "ay";
		}
		else
		{
			return "ERROR!";
		}
	}
	else
	{
		return "ERROR!";
	}
}