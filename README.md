# BLockChain for Aadhaar

A consumer is expected to provide his personal data along with his Aadhar number for authenticating with private providers (telecom, banks etc.). Using this information, the entity tries to authenticate the user to determine if he is indeed the rightful owner of the Aadhar number.But AUA(entities seeking Authentication through UIDAI) could  indulge in malpractices such as sharing user data without consent, combining databases with other AUAs etc. Eventually, as long as there are no strict laws restricting the use of Aadhar data, one should assume that data collected by these organisations is not private.Blockchain technology provides a sound solution to the problem of authentication without compromising on privacy.

	The above problem can be solved by using Ethereum <b>Smart Contracts</b>

    The AUA adds an authentication request to the blockchain. It specifies the user it wants to authenticate, and the purpose for which authentication is required.
    The user approves the request, then adds his personal data to the blockchain, encrypted such that only the government can decrypt it.
    The government then looks at the request from the AUA, and the data provided by the user, and calls its internal services to verify if the data provided by the user indeed corresponds to him/her.
    The government appropriately marks the request as rejected/approved.
    The AUA then queries the blockchain to see if its request has been approved by the government.

All the steps above which involve writing to the database are publicly accessible. Thus, the request from the AUA, the approval by the user, and the approval by the government can be verified by Proof of Work(PoW) Algorithm.



