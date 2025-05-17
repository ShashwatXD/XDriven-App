XDriven App

XDriven is a Flutter app built entirely on the concept of Server-Driven UI (SDUI). Instead of hardcoding screens in Flutter, all UI components — such as text, images, buttons, and layout structure — are sent from the backend via JSON. The app dynamically interprets these instructions and renders the interface on the fly.

This allows complete design flexibility and app updates without going through the Play Store or App Store — all powered by your backend.

🚀 What Makes XDriven Special?

 Dynamic UI via JSON: Every page is defined by a JSON response from the server, parsed and rendered in real-time.

 Renderer System: The Renderer maps uiType from JSON to actual Flutter widgets like UikText, UikContainer, UikIconButton, etc.

 Custom Widgets: All widgets (like text, image, container, buttons) are customized and extended to support JSON props like padding, color, fontSize, alignment, actions, etc.

 Backend-Driven Navigation: Tap actions (like navigating to another page or launching a URL) are also configured inside JSON.

 No Code Change Needed: UI updates can be made by changing the backend response — no Flutter redeploy required.
 
 Built-in Animations: Smooth transitions using AnimatedContainer and AnimatedOpacity for fade-in and scroll-based effects.

 Full Routing System: Built-in support for dynamic pages like /home, /about, /profile, etc.
