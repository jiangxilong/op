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

#include <hookflash/services/internal/hookflashTypes.h>
#include <hookflash/services/IRUDPListener.h>
#include <hookflash/services/internal/services_RUDPChannel.h>

#include <zsLib/Socket.h>

#include <list>
#include <map>
#include <utility>

#define HOOKFLASH_SERVICES_RUDPLISTENER_CHANNEL_RANGE_START (0x4000)
#define HOOKFLASH_SERVICES_RUDPLISTENER_CHANNEL_RANGE_END   (0x7FFF)

namespace hookflash
{
  namespace services
  {
    namespace internal
    {
      class RUDPListener : public zsLib::MessageQueueAssociator,
                           public IRUDPListener,
                           public zsLib::ISocketDelegate,
                           public IRUDPChannelDelegateForSessionAndListener
      {
      protected:
        typedef zsLib::PUID PUID;
        typedef zsLib::String String;
        typedef zsLib::IPAddress IPAddress;
        typedef zsLib::ISocketPtr ISocketPtr;
        typedef zsLib::SocketPtr SocketPtr;
        typedef zsLib::RecursiveLock RecursiveLock;
        typedef boost::shared_array<BYTE> RecycledPacketBuffer;
        typedef std::list<RecycledPacketBuffer> RecycledPacketBufferList;

      protected:
        RUDPListener(
                     IMessageQueuePtr queue,
                     IRUDPListenerDelegatePtr delegate,
                     WORD port,
                     const char *realm
                     );

        void init();

      public:
        ~RUDPListener();

        //IRUDPListener
        virtual PUID getID() const {return mID;}

        static RUDPListenerPtr create(
                                      IMessageQueuePtr queue,
                                      IRUDPListenerDelegatePtr delegate,
                                      WORD port,
                                      const char *realm
                                      );

        virtual IPAddress getListenerIP();

        virtual RUDPListenerStates getState() const;

        virtual void shutdown();

        virtual IRUDPChannelPtr acceptChannel(IRUDPChannelDelegatePtr delegate);

        //ISocketDelegate
        virtual void onReadReady(ISocketPtr socket);
        virtual void onWriteReady(ISocketPtr socket);
        virtual void onException(ISocketPtr socket);

        //IRUDPChannelDelegateForSessionAndListener
        virtual void onRUDPChannelStateChanged(
                                               RUDPChannelPtr channel,
                                               RUDPChannelStates state
                                               );

        virtual bool notifyRUDPChannelSendPacket(
                                                 RUDPChannelPtr channel,
                                                 const IPAddress &remoteIP,
                                                 const BYTE *packet,
                                                 ULONG packetLengthInBytes
                                                 );

      protected:
        String log(const char *message) const;
        void fix(STUNPacketPtr stun) const;

        bool isShuttingDown() {return RUDPListenerState_ShuttingDown == mCurrentState;}
        bool isShutdown() {return RUDPListenerState_Shutdown == mCurrentState;}

        void cancel();
        void setState(RUDPListenerStates state);

        bool bindUDP();

        bool sendTo(
                    const IPAddress &destination,
                    const BYTE *buffer,
                    ULONG bufferLengthInBytes
                    );

        bool handledNonce(
                          const IPAddress &remoteIP,
                          STUNPacketPtr &stun,
                          STUNPacketPtr &response
                          );

        bool handleUnknownChannel(
                                  const IPAddress &remoteIP,
                                  STUNPacketPtr &stun,
                                  STUNPacketPtr &outResponse
                                  );

        void getBuffer(RecycledPacketBuffer &outBuffer);
        void recycleBuffer(RecycledPacketBuffer &buffer);

        class AutoRecycleBuffer
        {
        public:
          AutoRecycleBuffer(RUDPListener &outer, RecycledPacketBuffer &buffer) : mOuter(outer), mBuffer(buffer) {}
          ~AutoRecycleBuffer() {mOuter.recycleBuffer(mBuffer);}
        private:
          RUDPListener &mOuter;
          RecycledPacketBuffer &mBuffer;
        };

        // remote IP address and channel number
        typedef std::pair<IPAddress, WORD> ChannelPair;

        class CompareChannelPair { // simple comparison function
        public:
          bool operator()(const ChannelPair &op1, const ChannelPair &op2) const;
        };

      protected:
        mutable RecursiveLock mLock;
        RUDPListenerWeakPtr mThisWeak;
        IRUDPListenerDelegatePtr mDelegate;
        PUID mID;

        RUDPListenerPtr mGracefulShutdownReference;

        RUDPListenerStates mCurrentState;

        WORD mBindPort;

        SocketPtr mUDPSocket;

        typedef std::map<ChannelPair, RUDPChannelPtr, CompareChannelPair> SessionMap;
        SessionMap mLocalChannelNumberSessions;   // local channel numbers are the channel numbers we expect to receive from the remote party
        SessionMap mRemoteChannelNumberSessions;  // remote channel numbers are the channel numbers we expect to send to the remote party

        typedef std::list<RUDPChannelPtr> PendingSessionList;
        PendingSessionList mPendingSessions;

        RecycledPacketBufferList mRecycledBuffers;

        BYTE mMagic[16];
        String mRealm;
      };
    }
  }
}
