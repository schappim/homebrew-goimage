# Homebrew Tap for goimage

This is the official Homebrew tap for [goimage](https://github.com/schappim/goimage) - a Go CLI for image generation using OpenAI (GPT Image), Google Gemini 2.5 Flash Image (nano banana), or xAI Grok image APIs.

## Installation

```bash
# Add the tap
brew tap schappim/goimage

# Install goimage
brew install goimage

# Upgrade to latest version
brew upgrade goimage
```

## Quick Start

```bash
# Set your API key(s)
export OPENAI_API_KEY="your-openai-api-key"
export GEMINI_API_KEY="your-google-ai-studio-key"  # optional
export XAI_API_KEY="your-xai-api-key"              # optional

# Generate from a prompt (uses OpenAI by default)
goimage "a watercolor of a fox in autumn leaves"

# Pipe a prompt from another command
echo "a logo for goimage" | goimage -o logo.png
```

## Providers

goimage supports three image-generation providers:

### OpenAI (default)

```bash
goimage "a hand-drawn map of a fantasy island"
goimage -m gpt-image-2 "a photorealistic kitchen at golden hour"
goimage -s 1536x1024 -q high "wide landscape banner"
```

### Google (nano banana)

```bash
goimage -p google "a cyberpunk teacup on a marble counter"
goimage -p google --aspect 16:9 "a cinematic shot of a misty pine forest"
goimage -p google --aspect 9:16 "a portrait of a desert sunset"
```

### Grok (xAI)

```bash
goimage -p grok "a Saturday-morning cartoon hedgehog as a barista"
goimage -p grok -n 4 -o variants.png "logo for a Go CLI"
```

## Usage

```bash
# Save to a specific path
goimage -o fox.png "a watercolor fox"

# Open the result after saving
goimage --open "a desk setup with mechanical keyboard and ferns"

# Generate multiple variations
goimage -n 3 -o cat.png "a cat in a hat"   # cat-1.png, cat-2.png, cat-3.png

# Choose a model
goimage -m gpt-image-1-mini "quick robot thumbnail"

# Choose an output format (OpenAI)
goimage --format webp "modern WebP output"

# Pipe an LLM prompt
llm "describe a poster for a sci-fi novel about whales in space" \
  | goimage -p google --aspect 9:16 --open
```

## Options

| Option        | Short | Description                                       | Default     |
|---------------|-------|---------------------------------------------------|-------------|
| `--provider`  | `-p`  | Provider (`openai`, `google`, `grok`)             | `openai`    |
| `--model`     | `-m`  | Model to use                                      | Provider-specific |
| `--output`    | `-o`  | Save to this path                                 | Auto-named  |
| `--size`      | `-s`  | Image size (OpenAI)                               | `1024x1024` |
| `--quality`   | `-q`  | `low` / `medium` / `high` / `auto` (OpenAI)       | `auto`      |
| `--format`    |       | `png` / `jpeg` / `webp` (OpenAI)                  | `png`       |
| `--aspect`    |       | Aspect ratio (Google)                             | `1:1`       |
| `--count`     | `-n`  | Number of images                                  | `1`         |
| `--open`      |       | Open the saved image                              | `false`     |
| `--token`     |       | API key                                           | From env    |

## Scripting Examples

```bash
# Generate from a file of prompts
while IFS= read -r line; do
  goimage -o "prompt-$RANDOM.png" "$line"
done < prompts.txt

# Compare providers side-by-side
prompt="a single matte black coffee cup on white"
goimage -p openai -o openai.png "$prompt"
goimage -p google -o google.png "$prompt"
goimage -p grok   -o grok.png   "$prompt"
```

## Documentation

For full documentation and more examples, see the [goimage README](https://github.com/schappim/goimage).

## License

MIT License
