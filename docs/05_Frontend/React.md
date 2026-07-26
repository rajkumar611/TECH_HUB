REACT — COMPLETE GUIDE

WHAT IS REACT?

React is a JavaScript library for building user interfaces (UI), created by Facebook.
It is component-based: you build the UI as a collection of small, reusable components.

React is NOT a full framework — it handles only the UI layer.
You combine it with other libraries for routing (React Router), state (Redux), and API calls.

WHY REACT IS SO POPULAR

React has the largest frontend ecosystem in the world:
- Biggest collection of libraries, UI kits, tools, and community packages
- Millions of npm packages available
- Massive global community = tutorials, support, and jobs everywhere

Analogy:
React = The biggest city in the world — more shops, services, and options than anywhere.
Angular = A planned town — everything available, but controlled and limited.
Vue = A smaller but beautiful city — growing fast, not as massive.

JSX
----
React uses JSX (JavaScript XML) — HTML-like syntax written inside JavaScript files.
  function Greeting() {
    return <h1>Hello, Raj!</h1>;
  }
JSX is compiled to plain JavaScript before the browser executes it.

FUNCTIONAL COMPONENTS (MODERN STANDARD)

Class components are legacy. The modern standard is functional components with hooks.
  function Counter() {
    const [count, setCount] = useState(0);
    return <button onClick={() => setCount(count + 1)}>Count: {count}</button>;
  }

REACT HOOKS

Hooks are built-in functions that let functional components manage state, side effects,
and context.

Common built-in hooks:
- useState        → local component state
                   const [name, setName] = useState("Raj");
- useEffect       → side effects (API calls, subscriptions, DOM updates)
                   useEffect(() => { fetchData(); }, []);
- useContext      → read values from the Context API (global shared state)
- useMemo         → memoize expensive calculations (performance)
- useCallback     → memoize functions (performance)

Mental model: React hooks manage component-level behaviour.

PROPS — PARENT TO CHILD DATA FLOW

Props = properties passed from a parent component to a child component.
Data flows DOWN (parent → child only, not upward).
  // Parent
  <UserCard name="Raj" role="Developer" />

  // Child
  function UserCard({ name, role }) {
    return <p>{name} — {role}</p>;
  }

STATE MANAGEMENT OPTIONS

1. useState (local state):
   - State lives inside one component
   - Good for simple, isolated state

2. Context API (built-in global state):
   - Lightweight, no extra library needed
   - Good for: theme, logged-in user, language settings
   - Drawback: every state change re-renders ALL consuming components
   - Not ideal for frequently-changing or deeply-nested state

   const ThemeContext = createContext();
   <ThemeContext.Provider value="dark">
     <App />
   </ThemeContext.Provider>
   // Consumer:
   const theme = useContext(ThemeContext);

3. Redux (full state management):
   - Centralised "store" holds all app state
   - Components dispatch "actions" → reducers update state
   - Ideal for: large apps, complex shared state, frequent updates
   - Has dev tools, time-travel debugging, middleware support
   - Drawback: more boilerplate than Context API

   Redux Hooks:
   - useSelector → read state from store
   - useDispatch → send actions to update store

4. Zustand:
   - Lightweight Redux alternative
   - Simpler syntax, much less boilerplate
   - Growing in popularity in modern React projects

Analogy:
Context API = small shared backpack
Redux = full warehouse with rules, logs, and security

REACT vs ANGULAR vs VUE

Feature            | React          | Angular         | Vue
-------------------|----------------|-----------------|---------------------
Type               | UI library     | Full framework  | Progressive framework
Learning curve     | Moderate       | Steep           | Easy
Created by         | Facebook/Meta  | Google          | Community (Evan You)
Language           | JavaScript/JSX | TypeScript      | JavaScript/TypeScript
Opinionated?       | No             | Yes (very)      | Moderate
Enterprise use     | High           | High            | Moderate
Community size     | Largest        | Large           | Smaller

When to use:
- React: Large SPAs, enterprise apps, when you want flexibility
- Angular: Full-featured framework with built-in routing, forms, DI
- Vue: Mid-size projects, quick prototypes, easier learning curve

KEY FACTS TO REMEMBER

- React = UI library, not a full framework
- Functional components + hooks = the modern standard (not class components)
- useState manages local state; useEffect handles side effects
- Props = read-only data passed from parent to child
- Context API = simple global state (good for theme/user/language)
- Redux = complex global state (predictable, debuggable, scalable)
- React has the largest frontend ecosystem — best library support
- React works with ANY backend: .NET, Java, Python, Node.js (all return JSON)
