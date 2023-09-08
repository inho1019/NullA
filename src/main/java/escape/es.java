package escape;

public class es {
	 public String escape(String input) {
		    if (input == null) {
		      return null;
		    }
		    StringBuilder escaped = new StringBuilder();
		    for (char c : input.toCharArray()) {
		      switch (c) {
		        case '<':
		          escaped.append("&lt;");
		          break;
		        case '>':
		          escaped.append("&gt;");
		          break;
		        case '&':
		          escaped.append("&amp;");
		          break;
		        case '"':
		          escaped.append("&quot;");
		          break;
		        case '\'':
		          escaped.append("&quot;");
		          break;
		        case '(':
		            escaped.append("&#40;");
		            break;
		        case ')':
		            escaped.append("&#41;");
		            break; 
		        default:
		          escaped.append(c);
		          break;
		      }
		    }
		    return escaped.toString();
		  }
}
