###
# be.bastelstu.WCF.Chat.Log
# 
# @author	Tim Düsterhus
# @copyright	2010-2012 Tim Düsterhus
# @license	Creative Commons Attribution-NonCommercial-ShareAlike <http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode>
# @package	be.bastelstu.wcf.chat
###

(($, window) ->
	be.bastelstu.WCF.Chat.Log = be.bastelstu.WCF.Chat.extend
		init: (@chat) ->
		handleMessages: (messages) ->
			# Insert the messages
			for message in messages
				@events.newMessage.fire message
				
				output = @chat.messageTemplate.fetch message
				li = $ '<li></li>'
				li.addClass 'timsChatMessage timsChatMessage'+message.type
				li.addClass 'ownMessage' if message.sender is WCF.User.userID
				li.append output
				
				li.appendTo $ '#timsChatLog .timsChatMessageContainer > ul'
				
	be.bastelstu.WCF.Chat.Log.loadOverlay = () ->
		if !$.wcfIsset 'timsChatLogDialog'
			container = $ '<fieldset id="timsChatLogDialog"></fieldset>'
			$('#content').append container
			
		$('#timsChatLogDialog').load 'http://127.0.0.1/wbb/wbb4/index.php/Chat/Log/1-Hauptchat/', () ->
			WCF.showDialog 'timsChatLogDialog', 
				title: 'Log'
)(jQuery, @)
