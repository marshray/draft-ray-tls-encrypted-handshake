draft-ray-tls-encrypted-handshake
================================

http://www.ietf.org/mail-archive/web/tls/current/msg08722.html

I would appreciate it if the participants of the TLS WG will give this draft a reading and serious consideration to taking it up as a work item:

* * *

http://datatracker.ietf.org/doc/draft-ray-tls-encrypted-handshake/

A new version of I-D, draft-ray-tls-encrypted-handshake-00.txt has been successfully submitted by Marsh Ray and posted to the IETF repository.

Filename:	 draft-ray-tls-encrypted-handshake
Revision:	 00

Title: Transport Layer Security (TLS) Encrypted Handshake Creation date: 2012-05-04

WG ID:		 Individual Submission
Number of pages: 18
Abstract:
   This specification defines a Transport Layer Security (TLS) extension
   which allows endpoints to negotiate the use of encryption with
   forward secrecy at the beginning of the handshake.  Two levels of
   functionality are defined.  Implementations are free to support one
   or both levels, with the first level incurring no additional
   computational or round-trip overhead.  The TLS cryptographic
   calculations are unchanged.

* * *

This draft is motivated by the discussions in recent weeks, when some related issues came up in a similar context:

* AGL et al. have some particular requirements for the handshake when using the NP(N)/SPDY feature. They really need confidentiality in negotiating the next protocol but they cannot afford the overhead of even one extra round trip (let alone renegotiation). I would like for them to be able to implement NP(N) in an RFC-defined way.

* When coupled with the RFC 4680 'TLS Handshake Message for Supplemental Data' that Martin Rex pointed out, it provides a powerful and very general way of negotiating features under encryption. It could possible enable new features.

* Alternatively, we could view this as a round-trip-saving optimization for certain handshake operations that really do need encryption.

* It allows to encrypt the client certificate without renegotiation, magic cipher suite values, or a bunch of new protocol that isn't useful for anything else.

* I watched a fascinating presentation from the Tor project
https://www.youtube.com/watch?v=GwMr8Xl7JMQ

Unfortunately, they are having to minimize their dependence on TLS because it's so easy to DoS selectively. I don't know if this proposal will make TLS suitable for Tor again, but I do think it represents a shortcoming of the protocol which deserves fixing.

* There's simply no reason TLS needs to leak so much plaintext.


* I believe it may help a little with the issue Nikos Mavrogiannopoulos and I were discussing, where an attacker is able to trick the client into interpreting the server's signed key exchange parameters as the wrong type of structure.

* To the implementers in the group: don't be fooled, it's not as big a change as it looks! I just tried to be extra careful to describe it step-by-step in the spec. Did I mention it doesn't change the crypto calculations?

Thanks,

 - Marsh

