App.updater = App.cable.subscriptions.create("UpdaterChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
  }
});

function waitIdle(wtime, func) {
      let timeout = null;

      function callback(context) {
          timeout = null;
          func.call(context);
      }

      function bump(context, time) {
          if (time == null) {
              time = wtime;
          }
          if (timeout != null) {
              window.clearTimeout(timeout);
          }
          if (time == 0) {
              callback(context);
          } else {
              timeout = window.setTimeout(callback, time, context)
          }
      }

      return bump;
}

function handleInput() {
  if (!this.target.getAttribute('contenteditable')) return;

  const chapterId = this.target.dataset.chapterId;
  const klass = this.target.className;
  const number = this.target.dataset.number;
  App.updater.perform("update", {class: klass, number, text: this.target.textContent, chapterId});
}

function captureInput() {
  document.addEventListener('keydown', waitIdle(1000, handleInput));
}

if (document.readyState !== 'loading') captureInput();
else document.addEventListener('DOMContentLoaded', captureInput);
