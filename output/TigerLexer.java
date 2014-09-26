// $ANTLR 3.5 C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g 2014-09-26 14:59:22

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

@SuppressWarnings("all")
public class TigerLexer extends Lexer {
	public static final int EOF=-1;
	public static final int ID=4;
	public static final int INTLIT=5;

	// delegates
	// delegators
	public Lexer[] getDelegates() {
		return new Lexer[] {};
	}

	public TigerLexer() {} 
	public TigerLexer(CharStream input) {
		this(input, new RecognizerSharedState());
	}
	public TigerLexer(CharStream input, RecognizerSharedState state) {
		super(input,state);
	}
	@Override public String getGrammarFileName() { return "C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g"; }

	// $ANTLR start "ID"
	public final void mID() throws RecognitionException {
		try {
			int _type = ID;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g:6:3: ( ( ( 'a' .. 'z' ) | ( 'A' .. 'Z' ) ) ( ( 'a' .. 'z' ) | ( 'A' .. 'Z' ) | ( '0' .. '9' ) | '_' )* )
			// C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g:6:5: ( ( 'a' .. 'z' ) | ( 'A' .. 'Z' ) ) ( ( 'a' .. 'z' ) | ( 'A' .. 'Z' ) | ( '0' .. '9' ) | '_' )*
			{
			if ( (input.LA(1) >= 'A' && input.LA(1) <= 'Z')||(input.LA(1) >= 'a' && input.LA(1) <= 'z') ) {
				input.consume();
			}
			else {
				MismatchedSetException mse = new MismatchedSetException(null,input);
				recover(mse);
				throw mse;
			}
			// C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g:6:29: ( ( 'a' .. 'z' ) | ( 'A' .. 'Z' ) | ( '0' .. '9' ) | '_' )*
			loop1:
			while (true) {
				int alt1=2;
				int LA1_0 = input.LA(1);
				if ( ((LA1_0 >= '0' && LA1_0 <= '9')||(LA1_0 >= 'A' && LA1_0 <= 'Z')||LA1_0=='_'||(LA1_0 >= 'a' && LA1_0 <= 'z')) ) {
					alt1=1;
				}

				switch (alt1) {
				case 1 :
					// C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g:
					{
					if ( (input.LA(1) >= '0' && input.LA(1) <= '9')||(input.LA(1) >= 'A' && input.LA(1) <= 'Z')||input.LA(1)=='_'||(input.LA(1) >= 'a' && input.LA(1) <= 'z') ) {
						input.consume();
					}
					else {
						MismatchedSetException mse = new MismatchedSetException(null,input);
						recover(mse);
						throw mse;
					}
					}
					break;

				default :
					break loop1;
				}
			}

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "ID"

	// $ANTLR start "INTLIT"
	public final void mINTLIT() throws RecognitionException {
		try {
			int _type = INTLIT;
			int _channel = DEFAULT_TOKEN_CHANNEL;
			// C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g:8:7: ( ( '1' .. '9' ) ( '0' .. '9' )* )
			// C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g:8:9: ( '1' .. '9' ) ( '0' .. '9' )*
			{
			if ( (input.LA(1) >= '1' && input.LA(1) <= '9') ) {
				input.consume();
			}
			else {
				MismatchedSetException mse = new MismatchedSetException(null,input);
				recover(mse);
				throw mse;
			}
			// C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g:8:19: ( '0' .. '9' )*
			loop2:
			while (true) {
				int alt2=2;
				int LA2_0 = input.LA(1);
				if ( ((LA2_0 >= '0' && LA2_0 <= '9')) ) {
					alt2=1;
				}

				switch (alt2) {
				case 1 :
					// C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g:
					{
					if ( (input.LA(1) >= '0' && input.LA(1) <= '9') ) {
						input.consume();
					}
					else {
						MismatchedSetException mse = new MismatchedSetException(null,input);
						recover(mse);
						throw mse;
					}
					}
					break;

				default :
					break loop2;
				}
			}

			}

			state.type = _type;
			state.channel = _channel;
		}
		finally {
			// do for sure before leaving
		}
	}
	// $ANTLR end "INTLIT"

	@Override
	public void mTokens() throws RecognitionException {
		// C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g:1:8: ( ID | INTLIT )
		int alt3=2;
		int LA3_0 = input.LA(1);
		if ( ((LA3_0 >= 'A' && LA3_0 <= 'Z')||(LA3_0 >= 'a' && LA3_0 <= 'z')) ) {
			alt3=1;
		}
		else if ( ((LA3_0 >= '1' && LA3_0 <= '9')) ) {
			alt3=2;
		}

		else {
			NoViableAltException nvae =
				new NoViableAltException("", 3, 0, input);
			throw nvae;
		}

		switch (alt3) {
			case 1 :
				// C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g:1:10: ID
				{
				mID(); 

				}
				break;
			case 2 :
				// C:\\Users\\Albert\\Desktop\\School\\Compilers\\PROJECT\\Tiger.g:1:13: INTLIT
				{
				mINTLIT(); 

				}
				break;

		}
	}



}
