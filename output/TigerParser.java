// $ANTLR 3.5 C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g 2014-09-26 14:59:22

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

@SuppressWarnings("all")
public class TigerParser extends Parser {
	public static final String[] tokenNames = new String[] {
		"<invalid>", "<EOR>", "<DOWN>", "<UP>", "ID", "INTLIT"
	};
	public static final int EOF=-1;
	public static final int ID=4;
	public static final int INTLIT=5;

	// delegates
	public Parser[] getDelegates() {
		return new Parser[] {};
	}

	// delegators


	public TigerParser(TokenStream input) {
		this(input, new RecognizerSharedState());
	}
	public TigerParser(TokenStream input, RecognizerSharedState state) {
		super(input, state);
	}

	@Override public String[] getTokenNames() { return TigerParser.tokenNames; }
	@Override public String getGrammarFileName() { return "C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g"; }



	// $ANTLR start "expression"
	// C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g:10:1: expression : ID ;
	public final void expression() throws  {
		try {
			// C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g:10:12: ( ID )
			// C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g:10:14: ID
			{
			match(input,ID,FOLLOW_ID_in_expression81); 
			}

		}
		catch (RecognitionException re) {
			reportError(re);
			recover(input,re);
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "expression"

	// Delegated rules



	public static final BitSet FOLLOW_ID_in_expression81 = new BitSet(new long[]{0x0000000000000002L});
}
