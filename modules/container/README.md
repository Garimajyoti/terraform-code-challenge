# Generate JSON Script

## 1. Overview / Purpose
This bash script generates a valid JSON file from a template by replacing placeholders `$ENV` and `$REGION` with user-provided values.  
It validates the JSON structure, field types, and ensures `instances > 0` before writing the output.  
The script is designed to be safe and executable in CI/CD pipelines.

---

## 2. Dependencies
The script requires the following Linux utilities:

- `jq` → For JSON parsing and validation  
- `envsubst` (from `gettext` package) → For placeholder substitution  

Install dependencies on Ubuntu:

```bash
sudo apt update
sudo apt install jq gettext -y
```

## 3. Usage / Input Parameters

Run the script as:

```bash
./generate_json.sh <unique_name> <region> <json_template_path>
```

### Parameters

| Parameter               | Description                                     |
|-------------------------|-------------------------------------------------|
| `<unique_name>`         | Replaces `$ENV` in the template                |
| `<region>`              | Replaces `$REGION` in the template             |
| `<json_template_path>`  | Path to the JSON template file                 |

---

### Example Usage

```bash
./generate_json.sh tiger westus2 a.json
```

## 4. Validation Rules

The script performs the following validations:

1. **JSON Syntax Check**  
   - Ensures the template file is valid JSON.  
   - If invalid, the script exits with an error.

2. **Required Fields**  
   - The JSON must contain the following fields:  
     - `name`  
     - `region`  
     - `instances`  
   - Missing fields cause the script to exit with an error.

3. **Field Types**  
   - `name` → string  
   - `region` → string  
   - `instances` → number greater than 0  

4. **Placeholder Replacement**  
   - `$ENV` is replaced by the `<unique_name>` parameter.  
   - `$REGION` is replaced by the `<region>` parameter.  
   - Hardcoded values in the template remain unchanged.

5. **Instances Value Check**  
   - `instances` must be a number greater than 0.  
   - If `0` or negative, the script exits with an error.

---

## 5. Error Handling / Exit Codes

| Exit Code | Meaning |
|-----------|---------|
| 0         | Success – valid JSON generated |
| 1         | Failure – missing argument, invalid JSON, missing fields, or invalid `instances` |

**Example errors:**

```text
ERROR: Missing required fields (name, region, instances).
ERROR: instances must be greater than 0.
ERROR: Invalid JSON in template file.
ERROR: File does not exist: b.json
```

## 6. Examples

### Example 1: Valid Template (`a.json`)

**Template (`a.json`):**

```json
{
  "type": "frontend",
  "name": "$ENV",
  "region": "$REGION",
  "instances": 2
}
```

**Command:**

```bash
./generate_json.sh tiger westus2 a.json
```

**Output (`tiger_output.json`):**

```json
{
  "type": "frontend",
  "name": "tiger",
  "region": "westus2",
  "instances": 2
}
```

### Example 2: Invalid Template (`c.json` with instances = 0)

**Template (`c.json`):**

**Command:**

```bash
./generate_json.sh tiger westus2 c.json
```

**Output:**
ERROR: instances must be greater than 0.

**Exit code:** 1