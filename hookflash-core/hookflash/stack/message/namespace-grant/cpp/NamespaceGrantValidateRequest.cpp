/*

 Copyright (c) 2013, SMB Phone Inc.
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

#include <hookflash/stack/message/namespace-grant/NamespaceGrantValidateRequest.h>
#include <hookflash/stack/message/internal/stack_message_MessageHelper.h>
#include <hookflash/stack/internal/stack_Stack.h>
#include <hookflash/stack/IHelper.h>
#include <hookflash/stack/IPeerFiles.h>
#include <hookflash/stack/IPeerFilePrivate.h>
#include <hookflash/stack/IPeerFilePublic.h>

#include <zsLib/XML.h>
#include <zsLib/helpers.h>

#define HOOKFLASH_STACK_MESSAGE_NAMESPACE_GRANT_VALIDATE_REQUEST_EXPIRES_TIME_IN_SECONDS ((60*60)*24)

namespace hookflash { namespace stack { namespace message { ZS_DECLARE_SUBSYSTEM(hookflash_stack_message) } } }

namespace hookflash
{
  namespace stack
  {
    namespace message
    {
      namespace namespace_grant
      {
        using zsLib::Seconds;
        using internal::MessageHelper;
        using stack::internal::IStackForInternal;

        //---------------------------------------------------------------------
        NamespaceGrantValidateRequestPtr NamespaceGrantValidateRequest::convert(MessagePtr message)
        {
          return boost::dynamic_pointer_cast<NamespaceGrantValidateRequest>(message);
        }

        //---------------------------------------------------------------------
        NamespaceGrantValidateRequest::NamespaceGrantValidateRequest()
        {
        }

        //---------------------------------------------------------------------
        NamespaceGrantValidateRequestPtr NamespaceGrantValidateRequest::create()
        {
          NamespaceGrantValidateRequestPtr ret(new NamespaceGrantValidateRequest);
          return ret;
        }

        //---------------------------------------------------------------------
        bool NamespaceGrantValidateRequest::hasAttribute(AttributeTypes type) const
        {
          switch (type)
          {
            case AttributeType_Purpose:           return mPurpose.hasData();
            case AttributeType_GrantInfo:         return mGrantInfo.hasData();
            case AttributeType_NamespaceInfos:    return (mNamespaceInfos.size() > 0);
            default:                              break;
          }
          return false;
        }

        //---------------------------------------------------------------------
        DocumentPtr NamespaceGrantValidateRequest::encode()
        {
          DocumentPtr ret = IMessageHelper::createDocumentWithRoot(*this);
          ElementPtr root = ret->getFirstChildElement();

          String clientNonce = IHelper::randomString(32);

          GrantInfo grantInfo;
          grantInfo.mID = mGrantInfo.mID;

          if (grantInfo.mSecret.hasData()) {
            grantInfo.mSecretProofExpires = zsLib::now() + Seconds(HOOKFLASH_STACK_MESSAGE_NAMESPACE_GRANT_VALIDATE_REQUEST_EXPIRES_TIME_IN_SECONDS);
            grantInfo.mSecretProof = IHelper::convertToHex(*IHelper::hmac(*IHelper::hash(grantInfo.mSecret), "namespace-grant-validate:" + grantInfo.mID + ":" + clientNonce + ":" + IMessageHelper::timeToString(grantInfo.mSecretProofExpires) + ":" + mPurpose));
          }

          if (grantInfo.hasData()) {
            root->adoptAsLastChild(MessageHelper::createElement(grantInfo));
          }

          if (hasAttribute(AttributeType_NamespaceInfos)) {
            ElementPtr namespacesEl = IMessageHelper::createElement("namespaces");

            for (NamespaceInfoMap::iterator iter = mNamespaceInfos.begin(); iter != mNamespaceInfos.end(); ++iter)
            {
              const NamespaceInfo &namespaceInfo = (*iter).second;
              namespacesEl->adoptAsLastChild(MessageHelper::createElement(namespaceInfo));
            }

            if (namespacesEl->hasChildren()) {
              root->adoptAsLastChild(namespacesEl);
            }
          }

          return ret;
        }
      }
    }
  }
}