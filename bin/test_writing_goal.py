"""Test writing_goal script functionality."""


def test_help():
    import subprocess

    result = subprocess.run(["writing_goal", "-h"], capture_output=True, text=True)
    assert result.returncode == 0
    assert "Usage: writing_goal" in result.stdout


def test_strip_markdown_syntax():
    import subprocess

    result = subprocess.run(
        ["writing_goal", "## Heading\n\nSome text."], capture_output=True, text=True
    )
    assert result.returncode == 0
    assert result.stdout == "Heading\n\nSome text."
