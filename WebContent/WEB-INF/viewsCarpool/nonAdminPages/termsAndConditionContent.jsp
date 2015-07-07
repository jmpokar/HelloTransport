<%@page import="com.corporate.transportdb.dto.updated.RoutePlaceMappingUpdated"%>
<%@page import="java.util.List"%>
<%@page import="com.corporate.transportdb.domain.RouteDetailsHelper"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

		<!-- JQUERY -->
		<%@ include file="../../../includes/transport/jquery.jsp" %>
 	
		<!-- BOOOTSTRAP -->
		<%@ include file="../../../includes/transport/bootstrap-css.jsp" %>
		
		<!-- MENUBAR STARTED -->
		<%@ include file="../../../includes/transport/menubar.jsp" %>
		<!-- MENUBAR ENDED -->	

		<!-- For Complete Page start -->
		<link rel="stylesheet" type="text/css" href="../css/body.css" media="screen">
		<!-- For Complete Page end -->
		
		<!-- CSS USED FOR STYLING HOME PAGE Start -->
		<link rel="stylesheet" type="text/css" href="../css/footer.css" media="screen">
		<!-- CSS USED FOR STYLING HOME PAGE END -->
		
		<!-- For Complete Page start -->
		<link rel="stylesheet" type="text/css" href="../css/stylingLetsPoolPage.css" media="screen">
		<!-- For Complete Page end -->

		<!-- CSS FOR HEADER MENU START -->	
	  	<link rel="stylesheet" type="text/css" href="../css/header_menu_css.css" media="screen" />
		<!-- CSS FOR HEADER MENU END -->
		
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
	    <%@ include file="../../../includes/transport/loopjTokenInput.jsp" %>
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->

		<!-- FEEDBACK PLUGIN START -->
		 <%@ include file="../../../includes/transport/feedbackPlugin.jsp" %>
		<!-- FEEDBACK PLUGIN END -->
	
		<!-- APP SWITCH JS START -->
		<%@ include file="../../../includes/transport/topNavBar.jsp" %>
		<!-- APP SWITCH JS END -->
		  
	</head>
	<body id="home">
	
		<%@ include file="../../../includes/transport/topNavBarBody.jsp" %>
		<div id="templatemo_wrapper">
	
		    <%@ include file="../../../includes/common/header.jsp" %>
		    <%@ include file="../../../includes/transport/userMenu.jsp" %>
    
    		<div class="cleaner h20"></div>
		    <div style="margin: 20px;"></div>
		    <div id="templatemo_main_top"></div>
		    
    		<div id="templatemo_main">
       			<div id="content" style="width: 90%;">        
        			<div id="wrapper">
						<div id="page">
							<!-- CONTENT START -->
							<div id="content_wrapper" class="">
								<div id="content_container" class="clearfix">
									<div id="terms" class="pad">
    									<p style="font-size: 10px; font-family: inherit;">
       										<center> <a href="#terms">Terms of Service</a> | <a href="#privacy">Privacy Policy</a> </center>
    									</p>
   										<h1 id="terms">Terms of Service</h1>
									    <p>
									        THIS FOLLOWING USER AGREEMENT DESCRIBES THE TERMS AND CONDITIONS ON WHICH Avaya Inc. OFFERS YOU ACCESS TO OUR SERVICES.
									    </p>
									    <p>
									        Welcome to the user agreement (the "Agreement" or "User Agreement" or "Terms of Service") for Avaya, a website owned and operated by Avaya Inc. This User Agreement is a legally binding agreement made between you ("You," "Your," or "Yourself") and Avaya Inc. ("Avaya," "Avaya.com," "We," "Us" or "Our").
									    </p>
									    <p>
									        Avaya's Carpool is an online service that provides a venue to enable persons who seek transportation to certain destinations ("Riders") to find and choose persons driving to or through those destinations ("Drivers"). For purposes of this Agreement these services shall collectively be defined as the "Services". This Agreement describes the terms and conditions that will govern Your use and participation of the Services. The Services include (but are not limited to) (1) the services available under the domain and sub-domains of www.Avaya.com (the "Site") and (2) any Avaya "widget" or service embedded on a third-party website such as a university, company, or other organization.
									    </p>
									    <p>
									        Please read this Agreement carefully before using the Services. You must read, agree with and accept all of the terms and conditions contained in this User Agreement, which includes those terms and conditions expressly set out below and those incorporated by reference, before You use any of the Services. By using any of the Services, You become a User of all Services available on the Site ("Participant" or "User") and You agree to be bound by the terms and conditions of this Agreement.
									    </p>
									    <p>
									        IF YOU DO NOT AGREE TO BE BOUND BY THE TERMS AND CONDITIONS OF THIS AGREEMENT, PLEASE DO NOT USE OR ACCESS OUR SERVICES OR REGISTER FOR THE SERVICES PROVIDED ON THE SITE. We may amend this Agreement at any time by posting the amended terms on the Site. Except as stated below, all amended terms shall automatically be effective when initially posted on the Site. We strongly recommend that, as You read this User Agreement, You also access and read the information contained in the other pages and websites referred to in this document, as they may contain further terms and conditions that apply to You as a Participant. This Agreement may not be otherwise amended except in a writing signed by You and Avaya, Inc.
									    </p>
									    <p>
									        Avaya's Carpool Team DOES NOT PROVIDE TRANSPORTATION SERVICES, AND Avaya IS NOT A TRANSPORTATION CARRIER. IT IS UP TO THE THIRD PARTY TRANSPORTATION PROVIDER, DRIVER OR VEHICLE OPERATOR TO OFFER TRANSPORTATION SERVICES WHICH MAY BE ARRANGED THROUGH USE OF THE SERVICES. Avaya OFFERS INFORMATION AND A METHOD TO OBTAIN SUCH THIRD PARTY TRANSPORTATION SERVICES, BUT DOES NOT AND DOES NOT INTEND TO PROVIDE TRANSPORTATION SERVICES OR ACT IN ANY WAY AS A TRANSPORTATION CARRIER, AND HAS NO RESPONSIBILITY OR LIABILITY FOR ANY TRANSPORTATION SERVICES PROVIDED TO YOU BY SUCH THIRD PARTIES.
									    </p>
									    <h3>Payment terms</h3>
									    <p>
									        Any fees which Avaya or any third party may charge Drivers and/or Riders for the Services are due immediately and are non-refundable. This no refund policy shall apply at all times regardless of (i) Your decision to terminate Your usage, (ii) Our decision to terminate Your usage, (iii) disruption caused to Our Services either planned, accidental or intentional, or (iv) any other reason whatsoever.  Avaya reserves the right to determine final prevailing pricing for Drivers and/or Riders.  Please note the pricing information published on the website may not reflect the prevailing pricing for Drivers and/or Riders.
									    </p>
									    <p>
									        Avaya, at its sole discretion, may make available promotional offers with different features and different rates to any of Our customers. These promotional offers, unless made to You, shall have no bearing whatsoever on Your offer or contract. Avaya may change the fees for Drivers or Riders for Our Services as we deem necessary for Our business. We encourage you to check our website periodically if You are interested in keep abreast of how We charge for the Services.
									    </p>
									    <h3>Eligibility</h3>
									    <p>
									        Our Services are available only to, and may only be used by individuals who can form legally binding contracts under applicable law. Without limiting the foregoing, Our Services are not available to children (persons under the age of 18) or to temporarily or indefinitely terminated Participants. By becoming a Participant, You represent and warrant that You are at least 18 years old. By using the Site or the Services, You represent and warrant that You have the right, authority and capacity to enter into this Agreement and to abide by the terms and conditions of this Agreement.
									    </p>
									    <p>
									        You are the sole authorized user of your account. You are responsible for maintaining the confidentiality of any password provided by You or Avaya for accessing the Service. You are solely and fully responsible for all activities that occur under Your password or account. Avaya has no control over the use of any User's account and expressly disclaims any liability derived therefrom. Should You suspect that any unauthorized party may be using Your password or account or You suspect any other breach of security, You will contact Us immediately.
									    </p>
									    <h3>Term and termination</h3>
									    <p>
									        This Agreement is effective upon use of the Site or Services for new Users and upon the posting dates of any subsequent amendments to this Agreement for all current Users. You may terminate Your participation in the Services at any time, for any reason by following the Notice of Termination instructions on the Site, or upon receipt by Us of Your written or email notice of termination. Either You or We may terminate Your participation in Avaya by removing Your Information at any time, for any or no reason, without explanation, effective upon sending written or email notice to the other party. Upon such termination by Us, We will remove all of Your information from our servers. We maintain sole discretion to bar Your use of the Service in the future, for any or no reason. Even after Your participation in Avaya's Carpool is terminated, this Agreement will remain in effect.
									    </p>
									    <h3>Your information</h3>
									    <p>
									        Your Information is any information You provide, publish or display ("post") to the Site or send to other Users in the registration or in any public message area (including, but not limited to the feedback section) or through any email feature ("Your Information"). Your Information will be stored on computers. You consent to Us using Your Information to create a User account that will allow You to participate in the Service. You are solely responsible for Your Information and Your interactions with other people in the public, and we act only as a passive conduit for Your online posting of Your Information. When You use Avaya's Carpool site, You agree to provide accurate, current and complete information as prompted by Our registration form and to maintain and update Your Information to keep it accurate, current and complete. You agree that We and other people of the public may rely on Your Information as accurate, current and complete. You acknowledge that if Your Information is untrue, inaccurate, not current or incomplete in any respect, We have the right to terminate this Agreement and Your use of the Services. You also agree to uphold and maintain Our Privacy Policy and to the terms and conditions thereof.
									    </p>
									    <h3>Restricted activities</h3>
									    <p>
									        You agree that You will use the Services in a manner consistent with any and all applicable laws and regulations. We reserve the right, but are not obligated to investigate and terminate Your participation in Avaya if You have misused the Site or the Services, or behaved in a way which could be regarded as inappropriate or whose conduct is unlawful or illegal. (i.) With respect to Your participation on the Site or through the Services, You agree that You will not: (a) Impersonate any person or entity; (b) "Stalk" or otherwise harass any person; (c) Express or imply that any statements You make are endorsed by Us, without Our specific prior written consent; (d) use any robot, spider, site search/retrieval application, or other manual or automatic device or process to retrieve, index, "data mine", or in any way reproduce or circumvent the navigational structure or presentation of the Service or its contents; (e) post, distribute or reproduce in any way any copyrighted material, trademarks, or other proprietary information without obtaining the prior consent of the owner of such proprietary rights; (f) remove any copyright, trademark or other proprietary rights notices contained in the Service; (g) interfere with or disrupt the Services or the site or the servers or networks connected to the Services or the site; (h) post, email or otherwise transmit any material that contains software viruses or any other computer code, files or programs designed to interrupt, destroy or limit the functionality of any computer software or hardware or telecommunications equipment; (i) forge headers or otherwise manipulate identifiers in order to disguise the origin of any information transmitted through the Service; (j) "frame" or "mirror" any part of the Service, without Our prior written authorization or use meta tags or code or other devices containing any reference to Us or the Service or the site in order to direct any person to any other web site for any purpose; (k) modify, adapt, sublicense, translate, sell, reverse engineer, decipher, decompile or otherwise disassemble any portion of the Service or any software used on or for the Service or cause others to do so; or (l) use the Services in connection with any commercial endeavors whatsoever without the express prior written consent of Avaya. (ii.) You further agree that Your Information and Your interactions on the Site shall not: (a) be false, inaccurate or misleading;(b) infringe any third party's rights, including but not limited to: intellectual property rights, copyright, patent, trademark, trade secret or other proprietary rights or rights of publicity or privacy; (c) violate any law, statute, ordinance or regulation; (d) be defamatory, trade libelous, abusive, obscene, profane, offensive, sexually oriented, threatening, harassing, racially offensive or illegal material; (e) contain any offensive anatomical or sexual references, or offensive sexually suggestive or connotative language; (f) include in Your Information any telephone numbers, street addresses, last names, URL's or E-mail addresses other than where explicitly asked for it in the Your registration and profile section; (h) contain any viruses, Trojan horses, worms, time bombs, cancelbots, easter eggs or other computer programming routines that may damage, detrimentally interfere with, surreptitiously intercept or expropriate any system, data or personal information; (i) create liability for us; and (j) link directly or indirectly to any other websites. You further agree that You will not transfer, use, or sell Your Avaya's Crapool account and/or ID to any another party. We reserve the right, but We have no obligation, to reject any Participant that does not comply with these prohibitions.
									    </p>
									    <h3>Proprietary rights</h3>
									    <p>
									        You warrant and represent to Us that Your Information is posted by You and that You are the sole author of Your Information. To enable Avaya to use Your Information without violating any rights You might have in such information, You automatically grant, and You represent and warrant that You have the right to grant, to Us and other Participants, a non-exclusive, worldwide, perpetual, irrevocable, royalty-free, sub-licensable (through multiple tiers) right to exercise the copyright, publicity, and database rights You have in Your Information and Your Content, and to use, copy, perform, display and distribute such information and content and to prepare derivative works of, or incorporate into other works, such information and content, in any media now known or not currently known, with respect to Your Information. Avaya will only use Your Information and Content in accordance with our Privacy Policy. You may remove Your Content or Your Information from the Site at any time. If You choose to remove Your Content or Your Information, the license granted above will automatically expire, however you acknowledge that Avaya may retain archived copies of Your Content. Avaya does not assert any ownership over Your Content; rather, as between Us and You, subject to the rights granted to us in these Terms of Service, You retain full ownership of all of Your Content and any intellectual property rights or other proprietary rights associated with Your Content. In addition, other Participants may post copyrighted information on the Site, which has copyright protection whether or not it is identified as copyrighted. Except for that information which is in the public domain or for which You have been given permission, You will not copy, modify, publish, transmit, distribute, perform, display, or sell any such proprietary information of other Participants on the Site.
									    </p>
									    <h3>Information control</h3>
									    <p>
									        We cannot verify or guarantee the accuracy of the information Users provide us on the Site, and We do not control the information provided by other Users that is made available through our system. Therefore, Avaya's Carpool team cannot and does not confirm each User's purported identity. You may find other User's information to be offensive, harmful, inaccurate, or deceptive. Please use caution and common sense when using the Site. Please note that there are also risks of dealing with underage persons or people acting under false pretense. By using this Site, You agree to accept such risks and Avaya is not responsible for the acts or omissions of users on the Site. In order to help You evaluate with whom You are dealing, Avaya's Carpool Team can link to a user's Facebook.com profile if they supply us with their Facebook.com account information. We also encourage You to communicate directly with each potential Driver or Rider prior to engaging in an arranged transportation service.
									    </p>
									    <h3>Avaya e-mail communications</h3>
									    <p>
									        E-mail communications sent from Us or through Us are designed to make Your Avaya experience more efficient. By becoming a Participant, You specifically agree to accept and consent to receiving e-mail communications initiated from Us or through Us, which include, without limitation: message notification e-mails, e-mails informing You about potential available Drivers or Riders and e-mails informing You of promotions We run and emails informing You of new and existing features We provide. If You do not wish to receive any of our e-mail communications please do not use the Service.
									    </p>
									    <h3>Intellectual property</h3>
									    <p>
									        All intellectual property rights on the Site and in the Service shall be owned by Us absolutely and in their entirety. These rights include and are not limited to database rights, copyright, design rights (whether registered or unregistered), trademarks (whether registered or unregistered) and other similar rights wherever existing in the world together with the right to apply for protection of the same. All other trademarks, logos, service marks, company or product names set forth in this website are the property of their respective owners. You acknowledge and agree that any questions, comments, suggestions, ideas, feedback or other information about the Site or the Service ("Submissions"), provided by You to Us are non-confidential and shall become the sole property of Avaya. Avaya shall own exclusive rights, including all intellectual property rights, and shall be entitled to the unrestricted use and dissemination of these Submissions for any purpose, commercial or otherwise, without acknowledgment or compensation to You.
									    </p>
									    <h3>Copyright complaints and copyright agent</h3>
									    <p>
									        Avaya's Carpool Team respects the intellectual property of others, and expects Users to do the same. If you believe, in good faith, that any materials on the Services infringe upon your copyrights, please send the following information to Avaya.com's Copyright Agent at Avaya Inc., 548 Market St #68514, San Francisco, CA 94104:
									    </p>
									    <ol class="numbered-list">
									        <li class="numbered-list">
									            A description of the copyrighted work that you claim has been infringed, including the URL (Internet address) or other specific location on the Service where the material you claim is infringed is located. Include enough information to allow Avaya's Carpool team to locate the material, and explain why you think an infringement has taken place;
									        </li>
									        <li class="numbered-list">
									            A description of the location where the original or an authorized copy of the copyrighted work exists -- for example, the URL (Internet address) where it is posted or the name of the book in which it has been published;
									        </li>
									        <li class="numbered-list">
									            Your address, telephone number, and e-mail address;
									        </li>
									        <li class="numbered-list">
									            A statement by you that you have a good faith belief that the disputed use is not authorized by the copyright owner, its agent, or the law;
									        </li>
									        <li class="numbered-list">
									            A statement by you, made under penalty of perjury, that the information in your notice is accurate, and that you are the copyright owner or authorized to act on the copyright owner's behalf; and
									        </li>
									        <li class="numbered-list">
									            An electronic or physical signature of the owner of the copyright or the person authorized to act on behalf of the owner of the copyright interest.
									        </li>
									    </ol>
									    <h3>Indemnity</h3>
									    <p>
									        You will defend, indemnify, and hold Us and Our officers, directors, employees, agents, each organization for which Avaya facilitates ridesharing among such organization's students, employees, consultants, members and/or other individuals affiliated with such organization (a "Partnering Organization") and any other third parties harmless, for any losses, costs, liabilities and expenses (including reasonable attorneys' fees) relating to or arising out of Your use of the Service, including: (a) Your breach of this Agreement or the documents it incorporates by reference; or (b) Your violation of any law or the rights of a third party, including, without limitation, any allegation that any materials that You submit to Us or transmit to the Service or to Us infringe or otherwise violate the copyright, trademark, trade secret or other intellectual property or other rights of any third party; and/or (c) Your activities in connection with the Service. This indemnity shall be applicable without regard to the negligence of any party, including any indemnified person.
									    </p>
									    <h3>Online content disclaimer</h3>
									    <p>
									        Opinions, advice, statements, offers, or other information or content made available through the service, but not directly by us, are those of their respective authors, and should not necessarily be relied upon. Such authors are solely responsible for such content. We do not guarantee the accuracy, completeness, or usefulness of any information on the service and neither do we adopt nor endorse nor are we responsible for the accuracy or reliability of any opinion, advice, or statement made by parties other than us. Under no circumstances will we be responsible for any loss or damage resulting from anyone's reliance on information or other content posted on the service, or transmitted to participants. We reserve the right, but we have no obligation, to monitor the materials posted in the public areas of the service. Notwithstanding this right, You remain solely responsible for the content of the photos, profiles (including your name, image, and likeness), messages, notes, text, information, music, video, advertisements, listings, and other content (the "Content") that You post in the public areas of the service and in Your private e-mail messages. We shall have the right to remove any such material that in our sole opinion violates, or is alleged to violate, the law or this agreement or which might be offensive, illegal, or that might violate the rights, harm, or threaten the safety of users or others. E-mails sent between You and other participants that are not readily accessible to the general public will be treated by us as private to the extent required by applicable law.
									    </p>
									    <p>
									        The Site contains (or you may be sent through the Site or the Service) links to other web sites ("Third Party Sites") as well as articles, photographs, text, graphics, pictures, designs, music, sound, video, information, applications, software and other content or items belonging to or originating from third parties (the "Third Party Applications, Software or Content"). Such Third Party Sites and Third Party Applications, Software or Content are not investigated, monitored or checked for accuracy, appropriateness, or completeness by us, and we are not responsible for any Third Party Sites accessed through the Site or any Third Party Applications, Software or Content posted on, available through or installed from the Site, including the content, accuracy, offensiveness, opinions, reliability, privacy practices or other policies of or contained in the Third Party Sites or the Third Party Applications, Software or Content. Inclusion of, linking to or permitting the use or installation of any Third Party Site or any Third Party Applications, Software or Content does not imply approval or endorsement thereof by us. If you decide to leave the Site and access the Third Party Sites or to use or install any Third Party Applications, Software or Content, you do so at your own risk and you should be aware that our terms and policies no longer govern. You should review the applicable terms and policies, including privacy and data gathering practices, of any site to which you navigate from the Site or relating to any applications you use or install from the site.
									    </p>
									    <h3>Other disclaimers</h3>
									    <p>
									        We, our subsidiaries, officers, directors, employees and our suppliers provide the Site and the Services on an "as is" basis and without any warranty or condition, express, implied or statutory. We do not guarantee and do not promise any specific results from use of the Site and/or the Services. We, our subsidiaries, officers, directors, employees and our suppliers specifically disclaim any implied warranties of title, merchantability, fitness for a particular purpose and non-infringement. Some states do not allow the disclaimer of implied warranties, so the foregoing disclaimer may not apply to You. This warranty gives You specific legal rights and You may also have other legal rights that vary from state to state. We do not warrant that Your use of the Service will be accurate, complete, reliable, current, secure, uninterrupted, always available, or error-free, or will meet Your requirements, that any defects in the Service will be corrected, or that the Services are free of viruses or other harmful components. We disclaim liability for, and no warranty is made with respect to, connectivity and availability. We cannot guarantee that each User is at least the required minimum age, nor do we accept responsibility or liability for any content, communication or other use or access of the Site or the Services by persons under the age of 18 in violation of this Agreement. We are not responsible or liable in any manner for any Content posted on the Site or in connection with the Service, whether posted or caused by Users of the Site, by Avaya.com, by third parties or by any of the equipment or programming associated with or utilized in the Site or the Service. Although We provide rules for User conduct and postings, We do not control and are not responsible for what Users post, transmit or share on the Site and are not responsible for any offensive, inappropriate, obscene, unlawful or otherwise objectionable content You may encounter on the Site or in connection with any Content. Avaya is not responsible for the conduct, whether online or offline, of any user of the Site or Service. It also is possible for others to obtain personal information about You due to Your use of the Site or the Services, and that the recipient may use such information to harass or injure You. We are not responsible for the use of any personal information that You disclose on the Site or through the Services. You are solely responsible for Your interactions with other Users. We reserve the right, but have no obligation, to monitor disputes between You and other Users. Please carefully select the type of information that You post on the Site or through the Services or release to others. We disclaim all liability, regardless of the form of action, for the acts or omissions of other Participants or Users (including unauthorized users, or "hackers"). Avaya's Carpool team only offers a venue that enables drivers and riders to match with each other. Avaya's Carpool team does not offer transportation services and Avaya is not a transportation company. We are not involved in the actual transportation services between Drivers and Riders. As a result, we have no control over the quality or safety of the transportation that occurs as a result of this rideshare venue service; nor do we have any control over the truth or accuracy of the of Participants' information listed on Avaya.com. We cannot ensure that a Driver or Rider is who he or she claims to be or that a Driver or Rider will actually complete an arranged service. We reserve the right to change any and all Content, software and other items used or contained in the Site and any Services offered through the Site at any time without notice. Reference to any products, services, processes or other information, by trade name, trademark, manufacturer, supplier or otherwise does not constitute or imply endorsement, sponsorship or recommendation thereof, or any affiliation therewith, by Avaya.
									    </p>
									    <p>
									        The Site and the Service may be temporarily unavailable from time to time for maintenance or other reasons. Avaya assumes no responsibility for any error, omission, interruption, deletion, defect, delay in operation or transmission, communications line failure, theft or destruction or unauthorized access to, or alteration of, User communications. Avaya is not responsible for any technical malfunction or other problems of any telephone network or service, computer systems, servers or providers, computer or mobile phone equipment, software, failure of email or players on account of technical problems or traffic congestion on the Internet or at any Site or combination thereof, including injury or damage to User's or to any other person's computer, mobile phone, or other hardware or software, related to or resulting from using or downloading materials in connection with the Web and/or in connection with the Service.
									    </p>
									    <h3>Limitation of liability</h3>
									    <p>
									        IN NO EVENT WILL WE, OUR SUBSIDIARIES, OFFICERS, DIRECTORS, EMPLOYEES OR OUR SUPPLIERS, BE LIABLE TO YOU FOR ANY INCIDENTAL, CONSEQUENTIAL, OR INDIRECT DAMAGES (INCLUDING, BUT NOT LIMITED TO, DAMAGES FOR DELETION, CORRUPTION, LOSS OF DATA, LOSS OF PROGRAMS, FAILURE TO STORE ANY INFORMATION OR OTHER CONTENT MAINTAINED OR TRANSMITTED BY OUR SERVICE, SERVICE INTERRUPTIONS, OR FOR THE COST OF PROCUREMENT OF SUBSTITUTE SERVICES) ARISING OUT OF OR IN CONNECTION WITH OUR SITE, OUR SERVICES OR THIS AGREEMENT (HOWEVER ARISING, INCLUDING NEGLIGENCE) EVEN IF WE OR OUR AGENTS OR REPRESENTATIVES KNOW OR HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. NEITHER WE NOR ANY OF OUR PARTNERING ORGANIZATIONS SCREEN THE PARTICIPANTS USING THE SERVICE IN ANY WAY. AS A RESULT, NEITHER WE NOR ANY OF OUR PARTNERING ORGANIZATIONS WILL BE LIABLE FOR ANY DAMAGES, DIRECT, INDIRECT, INCIDENTAL AND/OR CONSEQUENTIAL, ARISING OUT OF THE USE OF THE SITE OR THE SERVICES, INCLUDING, WITHOUT LIMITATION, TO DAMAGES ARISING OUT OF COMMUNICATING AND/OR MEETING WITH OTHER PARTICIPANTS OF THE SITE OR THE SERVICES, OR INTRODUCED TO YOU VIA THE SITE OR THE SERVICES. SUCH DAMAGES INCLUDE, WITHOUT LIMITATION, PHYSICAL DAMAGES, BODILY INJURY, DEATH AND OR EMOTIONAL DISTRESS AND DISCOMFORT. NOTWITHSTANDING ANYTHING TO THE CONTRARY CONTAINED HEREIN, OUR LIABILITY, AND THE LIABILITY OF OUR PARTNERING ORGANIZATIONS, SUBSIDIARIES, OFFICERS, DIRECTORS, EMPLOYEES, AND SUPPLIERS, TO YOU OR ANY THIRD PARTIES IN ANY CIRCUMSTANCE IS LIMITED TO $100. CERTAIN STATE LAWS DO NOT ALLOW LIMITATIONS ON IMPLIED WARRANTIES OR THE EXCLUSION OR LIMITATION OF CERTAIN DAMAGES. IF THESE LAWS APPLY TO YOU, SOME OR ALL OF THE ABOVE DISCLAIMERS, EXCLUSIONS OR LIMITATIONS MAY NOT APPLY TO YOU, AND YOU MAY HAVE ADDITIONAL RIGHTS.
									    </p>
									    <h3>Complaints</h3>
									    <p>
									        To resolve a complaint regarding the Service, You should first contact our Customer Service Department by email at <a href="mailto:patel286@avaya.com">patel286@avaya.com</a>.
									    </p>
									    <h3>Release</h3>
									    <p>
									        In the event that You have a dispute with one or more Users, You agree to release Avaya's Carpool team (and our officers, directors, agents, subsidiaries, joint ventures, Partnering Organizations and employees) from claims, demands and damages (actual and consequential) of every kind and nature, known and unknown, suspected and unsuspected, disclosed and undisclosed, arising out of or in any way connected to such disputes with other Users or to Your use of the Site or the Services. If you are a California resident, you waive California Civil Code Section 1542, which says: "A general release does not extend to claims which the creditor does not know or suspect to exist in his favor at the time of executing the release, which, if known by him must have materially affected his settlement with the debtor."
									    </p>
									    <h3>Breach</h3>
									    <p>
									        Without limiting other remedies, we may terminate Your Participation, remove Your Information, warn our community of Your actions, issue a warning, and refuse to provide our services to You if: (a) You breach this Agreement or the documents it incorporates by reference; (b) we are unable to verify or authenticate any information You provide to us; (c) we believe that Your actions may cause financial loss or legal liability for You, our users or us; or (d) if we suspect that You have engaged in fraudulent activity in connection with the Site or the Services.
									    </p>
									    <h3>Resolution of disputes and legal claims</h3>
									    <p>
									        You and We agree that all legal disputes or claims between the Parties will be submitted to binding arbitration in California. The arbitration shall be conducted by the American Arbitration Association, or any other established ADR provider mutually agreed upon by the parties. Any judgment on the award rendered by the arbitrator may be entered in any court having jurisdiction thereof. You agree that in no event shall any claim, action or proceeding by You related in any way to the Site and/or the Service (including Your visit to or use of the Site and/or the Service) be instituted more than three (3) years after the cause of action arose.
									    </p>
									    <h3>Privacy</h3>
									    <p>
									        We do not sell or rent Your Information to third parties for their marketing purposes without Your explicit consent and we only use Your information as described in the Privacy Policy. We view protection of users' privacy as a very important community principle. We understand clearly that You and Your information is one of our most important assets. We store and process Your information on computers located in the United States that are protected by physical as well as technological security devices. We use third parties to verify and certify our privacy principles. You may review our current Privacy Policy at Privacy Policy. If You object to Your Information being transferred or used in this way, please do not use or access our Services.
									    </p>
									    <h3>No agency</h3>
									    <p>
									        You and Avaya are independent contractors, and no agency, partnership, joint venture, employee-employer or franchisor-franchisee relationship is intended or created by this Agreement.
									    </p>
									    <h3>Notices</h3>
									    <p>
									        Except as explicitly stated otherwise, any notices to Avaya shall be given by certified mail, postage prepaid and return receipt requested to Avaya Inc., 548 Market St #68514, San Francisco, CA 94104, and any notices to You shall be given to You via the email address You provide to Avaya's Carpool team during the registration process. In such case, notice shall be deemed given 3 days after the date of mailing. Notice shall be deemed given 24 hours after email is sent, unless the sending party is notified that the email address is invalid. Alternatively, we may give You notice by certified mail, postage prepaid and return receipt requested, to the address provided to Avaya's Carpool team during the registration process. In such case, notice shall be deemed given 3 days after the date of mailing.
									    </p>
									    <h3>General</h3>
									    <p>
									        This Agreement shall be governed by the laws of the State of California without regard to choice of law principles. If any provision of this Agreement is held to be invalid or unenforceable, such provision shall be struck and the remaining provisions shall be enforced. You agree that this Agreement and all incorporated agreements may be automatically assigned by Avaya, Inc. in our sole discretion in accordance with the "Notices" section of this Agreement. Headings are for reference purposes only and in no way define, limit, construe or describe the scope or extent of such section. Our failure to act with respect to a breach by You or others does not waive our right to act with respect to subsequent or similar breaches. This Agreement sets forth the entire understanding and agreement between us with respect to the subject matter hereof. Sections referring to Services, Licenses, Liability Limit, Indemnity, and Resolution of Disputes shall survive any termination or expiration of this Agreement.
									    </p>
									    <h1 id="privacy">Privacy Policy</h1>
									    <p>
									        Avaya Inc. ("Avaya" or "we" or "Avaya.com") is dedicated to protecting your personal information and informing you about how we use it. This privacy policy applies to transactions and activities and data gathered on any Avaya service (the "Site") including but not limited to (1) the services available under the domain and sub-domains of www.Avaya.com and (2) any Avaya "widget" or service embedded on a third-party website such as a university, company, or other organization. Please review this privacy policy periodically as we may revise it without notice. This privacy policy was last revised on November 18, 2010. Each time you use the Site or provide us with information, by doing so you are accepting the practices described in this privacy policy at that time.
									    </p>
									    <h3>Your IP Address</h3>
									    <p>
									        Like most e-commerce Websites, each time you visit the Site, we automatically collect your IP address and the web page from which you came. In order to administer and optimize the Site for you and to diagnose problems with our Site, we use your IP address to help identify you and to gather broad demographic information about you.
									    </p>
									    <h3>Cookies</h3>
									    <p>
									        Avaya's Carpool team collects anonymous information through cookies. A cookie is a small piece of data containing a unique identification number that is sent to your browser from a Web server, and is stored on your computer's hard drive. The unique ID number identifies your browser to Avaya's Carpool team computers whenever you visit. Cookies do not enable anyone to access personally identifiable information that you have not already given us. Avaya's Carpool team primarily uses cookies to connect members with account information stored on Avaya's Carpool team computers. This helps Avaya's Carpool team to deliver better and more personalized service. Avaya's Carpool team also uses cookies to estimate Avaya's Carpool team audience size for advertisers; to assist in processing items in your shopping basket; to track the number of entries in Avaya's Carpool team promotions, sweepstakes and contests; to identify the areas of the site you visit; to hold session information; and to track user preferences.
									    </p>
									    <p>
									        Cookies are part of the technology implemented by your browser. Most browsers are initially set up to accept cookies. You can reset your browser to either notify you when you have received a cookie, or to refuse them all together.
									    </p>
									    <p>
									        Avaya's Carpool team relies on cookies to preserve the Avaya's Carpool team identity you have created while logged on. If you set your browser to disable cookies, you may not be able to access certain areas on the Site.
									    </p>
									    <h3>Data We Collect From You</h3>
									    <p>
									        In order to operate the Site and to provide you with information about products or services that may be of interest to you, we may collect "personal information" (i.e. information that could be used to contact you directly (without using the Site) such as full name, postal address, phone number, credit/debit card information, or email address) or "demographic information" (i.e. information that you submit, or that we collect, that is not personal information; this may include, but is not limited to, zip code, hometown, gender, username, age/birth date, browsing history information, searching history information, and registration history information. Demographic information is divided into two categories: 1) "non-public information", which consists of ride transaction information and one-on-one communications between you and other users of the Site; and 2) "public information", which consists of all other demographic information. Please note that nowhere on the Site do we knowingly collect, keep or maintain personal information from children under the age of 18, as we require that all users represent to us that they are at least 18 years old.
									    </p>
									    <h3>How We Use Personal Information</h3>
									    <p>
									        We use your email address and your other personal information to help us efficiently operate the Site, to contact you in connection with your transactions and other activities on the Site (including, but not limited to, confirmation emails, or important news that could affect your relationship with the Site), to forward trip information to you from other Site users and to contact you and others to suggest potential carpool matches. These types of communications, are known as "Operational Communications." In some cases, Operational Communications may also contain commercial messages, such as banner ads and special offers.
									    </p>
									    <p>
									        To operate the Site, including processing your transactions and supporting your activities on the Site, we may share your personal information with our agents, representatives, contractors and service providers so they can provide us with support services such as email origination, receipt or support services, customer relationship management services, and order fulfillment. We require these entities not to use your information for any other purpose.
									    </p>
									    <p>
									        By purchasing, or registering or making reservations for, products or services offered or sponsored by third parties on the Site, or electing to receive communications (such as emails or material by mail) or electing to participate in contests, sweepstakes or other programs (such as discount or rewards programs), offered or sponsored by third parties on the Site, you consent to our providing your personal information to those third parties. Those third parties may use your personal information in accordance with their own privacy policies. You will need to contact those third parties to instruct them directly regarding your preferences for the use of your personal information by them. Additionally, you agree that we may use and disclose all such information so submitted to such third parties in the same manner in which we are entitled to use and disclose any other information you submit to us.
									    </p>
									    <p>
									        Any third party with whom we are allowed to share your personal information is authorized to use your personal information in accordance with our contractual arrangements with such third parties and in accordance with their own privacy policies, over which we have no control, and you agree that we are not responsible or liable for any of their actions or omissions. Those who contact you will need to be instructed directly by you regarding your preferences for the use of your personal information by them.
									    </p>
									    <h3>How We Use Demographic Data</h3>
									    <p>
									        We may review all demographic Data. We may use public information to enable other users to search your profile, to determine whether your trip details fit other user's requirements, and to communicate with you. We may use demographic information to tailor the Site and communications to your interests. We may also share demographic information with advertisers on an anonymous and aggregated basis (i.e., without telling the advertisers your identity). One of the reasons we may do this is to increase the likelihood that our advertisers' goods and services will appeal to you as a Avaya user. Our sharing of demographic information with advertisers is anonymous (i.e., we do not tell advertisers which particular Site users are members of which demographic groups), subject to the rest of this privacy policy. When you respond to an advertisement, however, we ask you to remember that if that ad that is targeted to a demographic group and you decide to give the advertiser your personal information, then the advertiser may be able to identify you as being a member of that demographic group.
									    </p>
									    <h3>How to Edit Your Information</h3>
									    <p>
									        Avaya's Carpool team believes strongly in giving you the ability to access and edit your personal information. To update your personal info, click My Account at the top of any page. There you can view, update and correct your account information. You may edit your profile at any time -- all you need is your username and password.
									    </p>
									    <p>
									        So that we can protect the integrity of sensitive data, there are certain pieces of information, such as your age, that you cannot alter yourself. For example, since children under 18 are not allowed to register as Avaya's Carpool team members, we need to take reasonable measures to preserve the accuracy of our members' ages. Please contact us at <a href="mailto:patel286@avaya.com">patel286@avaya.com</a> to find out how to change information you cannot access through your Profile.
									    </p>
									    <p>
									        Our databases automatically update any personal information you edit in your profile, or that you request we edit. Information transmitted through boards, chats, polls or through any other means remain in our databases and become the property of Avaya's Carpool team upon submission. Keep this in mind if you decide to communicate personal information through any of these applications.
									    </p>
									    <h3>Information Retention</h3>
									    <p>
									        To preserve the integrity of our databases, standard procedure calls for us to retain information submitted by members for an indefinite length of time. Avaya's Carpool team understands your submissions as consent to store all your information in one place for this indefinite length of time, if we so wish. If required by law, as is the case to comply with the Children's Online Privacy Protection Act (COPPA), we will nullify member information by erasing it from our database. We will also respond to written member requests to nullify account information. If you wish to make such a request, which requires that we verify your identity, or if you have any questions regarding this policy, contact Avaya.com at <a href="mailto:patel286@avaya.com">patel286@avaya.com</a>. Also, by using this site, you do hereby represent and warrant that you understand and agree that all information submitted by you to Avaya.com becomes the property of Avaya.com and may be used in the sole discretion of Avaya.com in accordance with this Privacy Policy and the Terms of Use.
									    </p>
									    <h3>Choice/Opt-Out</h3>
									    <p>
									        Our site provides users the opportunity to opt-out of receiving communications from us and our partners at the point where we request information about the visitor. This site gives users the option to remove their information from our database, to not receive future communications or to no longer receive our service.
									    </p>
									    <h3>Special Cases in which we Share Personal Information</h3>
									    <p>
									        Your personal information may be passed on to a third party in the event of a transfer of ownership or assets, or a bankruptcy. We may also disclose personal information when we determine that such disclosure is necessary to comply with applicable law, to cooperate with law enforcement or to protect the interests or safety of the Site or other visitors to the Site. We also may disclose your personal information to our subsidiary and parent companies and businesses, and other affiliated legal entities and businesses with whom we are under common corporate control. Whenever personal information is disclosed under this paragraph, we may also disclose your demographic information along with it, on a non-anonymous basis. All of our parent, subsidiary and affiliated legal entities and businesses that receive your personal information or non-anonymous demographic information from us will comply with the terms of this privacy policy with respect to their use and disclosure of such information.
									    </p>
									    <h3>Our Security Precautions</h3>
									    <p>
									        Your Avaya.com Profile is password-protected so that only you and authorized Avaya.com employees have access to your account information. In order to maintain this protection, do not give your password to anyone. If someone who represents to you they are Avaya.com staff asks for any personal account information, including password, check their URL. If it doesn't say they are <a href="mailto:patel286@avaya.com">patel286@avaya.com</a>, they're not. Also, if you share a computer, you should sign out of your Avaya.com account and close the browser window before someone else logs on. This will help protect your information entered on public terminals from disclosure to third parties.
									    </p>
									    <p>
									        Avaya.com makes every effort to ensure that your information is secure on its system. Avaya.com has staff dedicated to maintaining this Privacy Policy and other privacy initiatives, periodically reviewing Web security and making sure that every Avaya.com employee is aware of our security practices. Unfortunately, no data transmission over the Internet can be guaranteed to be 100% secure. As a result, Avaya.com cannot guarantee the security of any information you transmit to us, and you do so at your own risk. If you have any further questions on this issue, refer to the site Terms of Use. Avaya.com expressly disclaims any liability that may arise should any other individuals obtain the information you submit to this site.
									    </p>
									    <p>
									        The Site has security measures in place to protect against the loss, misuse and alteration of the information under our control. Your information may be transferred to and maintained on computer networks which may be located outside of the state, province, country or other governmental jurisdiction in which you reside, and the country or jurisdiction in which these computer networks are located may not have privacy laws as protective as the laws in your country or jurisdiction.
									    </p>
									    <p>
									        Avaya.com may contain links to other websites. We are of course not responsible for the privacy practices of other web sites. We encourage our users to be aware when they leave our site to read the privacy statements of each and every web site that collects personally identifiable information. This Privacy Policy applies solely to information collected by Avaya.com.
									    </p>
									    <h3>Changing our Privacy Policy for Previously Gathered Information</h3>
									    <p>
									        If at any point we decide to use particular personally identifiable information in a manner materially different from that stated at the time it was collected, we will notify users by way of an email or by providing 30 days notice on the Site. Avaya.com also encourages you to review this privacy policy periodically. By using the site, you do hereby represent and warrant that you have read, understand and agree to all terms of this Privacy Policy and Terms of Service. Each time you use the site, you agree to all terms set forth by Avaya.com in both its Privacy Policy and Terms of Service and any other policies published by Avaya.com on the site. If you do not understand any of the terms or conditions of any of Avaya.com's policies, you may inquire regarding the same via electronic correspondence (e-mail) at <a href="mailto:patel286@avaya.com">patel286@avaya.com</a>. Please note that we will continue to have the right to change our privacy policy and practices, and how we use your personally identifiable information, without notice, as described in the first paragraph of this Privacy Policy, provided that such changes shall only apply to information gathered on or after the date of the change.
									    </p>
									    <h3>Contacting the Web Site</h3>
									    <p>
									        If you have any questions about this privacy statement, the practices of this site, or your dealings with this Web site, you may contact us at <a href="mailto:patel286@avaya.com">patel286@avaya.com</a>.
									    </p>
									</div>
            					</div>
        					</div>
							<!-- CONTENT END -->
						</div>
					</div>
					<c:if test="${dataSavingResult ne null}">
						${dataSavingResult}
					</c:if>					
        		</div>
        		<div class="cleaner"></div>
    		</div> 
			<%@ include file="../../../includes/transport/footer.jsp" %>
		</div>
    </body>
</html>
