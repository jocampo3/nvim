# Agent Guidelines

## Ground Rules and Boundaries

* ✅ **Always do:**
  * Avoid unnecessary comments on code that is already self-documenting. Comments should be reserved for complex logic or non-obvious behavior—not for things that are already clear from variable names, types, or simple function calls.
  * Write new files to the appropriate `src/` or `docs/` directories.
  * Follow the [Conventional Commits](https://www.conventionalcommits.org) specification (e.g., `feat:`, `fix:`, `docs:`) for commit messages.
  * Ensure all tests pass before suggesting a merge.
  * Be mindful of security when handling I/O and external resources. Never hardcode secrets.

---

## Examples

### Bad Comments

```javascript
/**
 * Adds two numbers together.
 * @param a The first number.
 * @param b The second number.
 * @returns The sum of a and b.
 */
const add = (a: number, b: number): number => {
  return a + b;
};

Reasoning:
This comment is overly explicit. The function name, parameters, and return type already make the behavior obvious. Most modern editors and LSPs can surface this information automatically, so the comment adds noise rather than value.

// Get the post with ID 82
$post = get_post(82);

Reasoning:
This comment simply restates what the code already communicates. A developer should reasonably infer what a function named get_post() does.

Good Comments
{{ include(template_from_string(lang.form)) }} <!-- form tag start -->
</form>

Reasoning:
This comment clarifies behavior that may not be obvious at first glance. The template is dynamically generated via an external plugin, so the comment helps developers understand where the <form> tag originates.

quoteHeightClasses, // If scrollContent is true, the user can adjust the height of the scrollable content. If false, the content height automatically fits the quote text.

Reasoning:
This comment provides context that is not immediately obvious from the variable name alone. It explains how the prop behaves and how it interacts with another prop (scrollContent). Without this explanation, a developer might need to inspect multiple components or experiment with the UI to understand the behavior.
