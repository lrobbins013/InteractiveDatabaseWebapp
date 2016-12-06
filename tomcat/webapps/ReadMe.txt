Navigating the website:

The homepage (index.html) presents the user with two buttons:
	1. "Patient Login" which navigates to the patient login page
	2. "Query our Database!" which takes the user to a page with a single text field
	    and the basic schema of our relations in for creating queries.

Patient Login:
	The user can either input the first and last name of the patient they would like
	to log in as or to register a new patient to the database.

	After logging in, the user is shown the patient they are logged in as and their
	current account balance. They are given 6 options to choose from:

	
	1. Schedule an Appoinment
		Takes the inputed date (in [mmdd] format) adn time (in [hh] format) and
		schedules the current patient for an appointment if they are not
		already scheduled at that time. They are then able to navigate back to 
		the patient home.

	2. Check current appointments
		Queries the database for all of the appointments that a patient has booked.

	3. Make a payment
		Allows a patient to submit a payment to the database to change their
		current account balance.

	4. View Transaction History
		Allows a patient to view every payment they have made.

	5. Service information
		Navigates to a page that allows the user to check the current supply list,
		see the available procedures and their costs, or submit a service event.
		Service events are when a patient shows up for their appointment which
		they are charged for.

	6. Logout
		Returns the user to index.html


Workload:

	Lucas Robbins was in charge of the web client. This included the creation of the html and jsp files for the website
	and communicating between the web application layer and the database layer.