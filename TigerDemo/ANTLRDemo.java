import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;
import org.antlr.stringtemplate.*;

public class ANTLRDemo {
    public static void main(String[] args) throws Exception {
	ANTLRFileStream in = new ANTLRFileStream("Test.tiger");
	TigerLexer lexer = new TigerLexer(in);
	CommonTokenStream tokens = new CommonTokenStream(lexer);
	TigerParser parser = new TigerParser(tokens);
	CommonTree tree = (CommonTree)parser.eval().getTree();
    	DOTTreeGenerator gen = new DOTTreeGenerator();
    	StringTemplate st = gen.toDOT(tree);
    	System.out.println(st);
    }
}
