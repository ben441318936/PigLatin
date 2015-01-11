import java.util.*;

public void setup() {
	String lines[] = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
	String HymnLines[] = loadStrings("LowellHymn.txt");
	ArrayList <ArrayList <String> > HymnWords=new ArrayList <ArrayList <String> > ();
	for(int i = 0; i < HymnLines.length; i++)
	{
		String[] aTemp=HymnLines[i].split("[[\040][\054][\056]]");
		ArrayList <String> alTemp= new ArrayList <String> ();
		for(int x=0; x<aTemp.length; x++)
		{
			alTemp.add(aTemp[x]);
		}
		if(HymnLines[i].length()>0)
		{
			alTemp.add(HymnLines[i].substring(HymnLines[i].length()-2,HymnLines[i].length()-1));
		}
		HymnWords.add(alTemp);
	}
	for(int i=0;i<HymnWords.size();i++)
	{
		for(int x=0;x<HymnWords.get(i).size()-1;x++)
		{
			if(x<HymnWords.get(i).size()-2)
			{
				print(pigLatin((HymnWords.get(i)).get(x))+" ");
			}
			else
			{
				print(pigLatin((HymnWords.get(i)).get(x)));
			}
		}
		println(HymnWords.get(i).get(HymnWords.get(i).size()-1));
	}
}
public void draw()
{
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	String temp=sWord.toLowerCase();
	for(int i=0;i<temp.length();i++)
    {
      if(temp.charAt(i)=='a' || temp.charAt(i)=='e' || temp.charAt(i)=='i' || temp.charAt(i)=='o' || temp.charAt(i)=='u')
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
	if(sWord.equals(" ") || sWord.equals(".") || sWord.equals(",") || sWord.equals("!") || sWord.equals(""))
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
		if(sWord.charAt(0)=='q' && sWord.charAt(1)=='u')
		{
			String temp = sWord.substring(2,sWord.length());
			return temp + "qu" + "ay";
		}
		if(sWord.charAt(0)=='Q' && sWord.charAt(1)=='u')
		{
			String temp = sWord.substring(2,sWord.length());
			String cap = temp.substring(0,1).toUpperCase();
			return cap + temp.substring(1,temp.length()).toLowerCase() + "qu" + "ay";
		}
		else if(findFirstVowel(sWord)>0)
		{
			if(sWord.charAt(0)<=90 && sWord.charAt(0)>=65)
			{
				String temp = sWord.substring(findFirstVowel(sWord),sWord.length()) + sWord.substring(0,findFirstVowel(sWord));
				String cap = temp.substring(0,1).toUpperCase();
				return cap + temp.substring(1,temp.length()).toLowerCase() + "ay";
			}
			else
			{
				String temp = sWord.substring(findFirstVowel(sWord),sWord.length()) + sWord.substring(0,findFirstVowel(sWord));
				return temp + "ay";
			}
			
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