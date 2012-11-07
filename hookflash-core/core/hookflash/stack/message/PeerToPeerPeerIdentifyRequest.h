/*
 
 Copyright (c) 2012, SMB Phone Inc.
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 The views and conclusions contained in the software and documentation are those
 of the authors and should not be interpreted as representing official policies,
 either expressed or implied, of the FreeBSD Project.
 
 */

#pragma once

#include <hookflash/stack/message/hookflashTypes.h>
#include <hookflash/stack/message/MessageRequest.h>
#include <hookflash/stack/message/MessageFactoryStack.h>

namespace hookflash
{
  namespace stack
  {
    namespace message
    {
      namespace internal { class PeerToPeerPeerIdentifyRequest;}

      class PeerToPeerPeerIdentifyRequest : public MessageRequest
      {
      public:
        typedef zsLib::Time Time;

        friend class internal::PeerToPeerPeerIdentifyRequest;

        enum AttributeTypes
        {
          AttributeType_ProofID,
          AttributeType_LocationID,
          AttributeType_FindSecret,
          AttributeType_OneTimeKey,
          AttributeType_Expires,
          AttributeType_UserAgent,
          AttributeType_PeerFile,
        };

      public:
        static PeerToPeerPeerIdentifyRequestPtr convert(MessagePtr message);

        static PeerToPeerPeerIdentifyRequestPtr create();

        virtual DocumentPtr encode(IPeerFilesPtr peerFile = IPeerFilesPtr());

        virtual Methods method() const                {return (Message::Methods)MessageFactoryStack::Method_PeerToPeer_PeerIdentify;}

        virtual IMessageFactoryPtr factory() const    {return MessageFactoryStack::singleton();}

        bool hasAttribute(AttributeTypes type) const;

        const String &proofID() const                 {return mProofID;}
        void proofID(const String &val)               {mProofID = val;}

        const String &findSecret() const              {return mFindSecret;}
        void findSecret(const String &val)            {mFindSecret = val;}

        const String &locationID() const              {return mLocationID;}
        void locationID(const String &val)            {mLocationID = val;}

        Time expires() const                          {return mExpires;}
        void expires(Time val)                        {mExpires = val;}

        const String &userAgent() const               {return mUserAgent;}
        void userAgent(const String &val)             {mUserAgent = val;}

        const String &oneTimeKey() const              {return mOneTimeKey;}

        IPeerFilePublicPtr peerFilePublic() const     {return mPeerFilePublic;}
        void peerFilesPublic(IPeerFilePublicPtr val)  {mPeerFilePublic = val;}

      protected:
        PeerToPeerPeerIdentifyRequest();

        String mProofID;
        String mFindSecret;
        String mLocationID;
        Time mExpires;
        String mUserAgent;

        IPeerFilePublicPtr mPeerFilePublic;
        String mOneTimeKey;
      };
    }
  }
}
