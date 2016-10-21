import java.io.IOException;
import java.io.PrintWriter;


import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.lang.*;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.ec2.*;
import com.amazonaws.services.ec2.model.*;
/**
 * Servlet implementation class StartApp
 */
@WebServlet("/StartApp")
public class StartApp extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    /**
     * Default constructor. 
     */
	ArrayList<String> instanceIds;
	AmazonEC2 ec2;
	// 处理 GET 方法请求的方法
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
			// 设置响应内容类型
			response.setContentType("text/html;charset=UTF-8");

			PrintWriter out = response.getWriter();
			String name = request.getParameter("name");

			if(name.equals("start"))
			{
				out= response.getWriter();
				 AWSCredentials credentials = null;
			        try {
			            credentials = new ProfileCredentialsProvider().getCredentials();
			        } catch (Exception e) {
			            throw new AmazonClientException(
			                    "Cannot load the credentials from the credential profiles file. " +
			                            "Please make sure that your credentials file is at the correct " +
			                            "location (~/.aws/credentials), and is in valid format.",
			                    e);
			        }
			        // Create the AmazonEC2Client object so we can call various APIs.
			        this.ec2 = new AmazonEC2Client(credentials);
			        Region usWest2 = Region.getRegion(Regions.US_WEST_2);
			        ec2.setRegion(usWest2);
			        // Initializes Instance Request
			        RunInstancesRequest runn = new RunInstancesRequest();
			        runn.withImageId("ami-e50ed085")
			                .withInstanceType("t1.micro")
			                .withMinCount(1)
			                .withMaxCount(1)
			                .withKeyName("COMP3100")
			                .withSecurityGroups("try");
			        RunInstancesResult run= ec2.runInstances(runn);
				    String result =run.getReservation().getInstances().get(0).getInstanceId();
				    this.instanceIds.add(result);
				    //String DNS = run.getReservation().getInstances().get(0).getPublicDnsName();
				    //out.print("<script>window.open(DNS+'webbank/index.jsp')</script>");
		    }			
			if(name.equals("stop"))
			{
			  AWSCredentials credentials = null;
			  try {
			    credentials = new ProfileCredentialsProvider().getCredentials();
			  } catch (Exception e) {
			  throw new AmazonClientException(
			      "Cannot load the credentials from the credential profiles file. " +
			      "Please make sure that your credentials file is at the correct " +
			      "location (~/.aws/credentials), and is in valid format.",
			      e);
			      }
			  // Create the AmazonEC2Client object so we can call various APIs.
			  this.ec2 = new AmazonEC2Client(credentials);
			  Region usWest2 = Region.getRegion(Regions.US_WEST_2);
			  this.ec2.setRegion(usWest2);
			  TerminateInstancesRequest TIR=new TerminateInstancesRequest(this.instanceIds);
		   this.ec2.terminateInstances(TIR);
			}
		}
		// 处理 POST 方法请求的方法
		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
		}
	
}