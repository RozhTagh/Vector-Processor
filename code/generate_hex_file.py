import random

def generate_512bit_hex():
    return ''.join(random.choices('0123456789ABCDEF', k=8))

def write_to_file(filename, num_lines):
    with open(filename, 'w') as f:
        for _ in range(num_lines):
            hex_number = generate_512bit_hex()
            f.write(f"{hex_number}\n")

# Generate a file with 512 lines of 512-bit hex numbers
write_to_file('hex_file.txt', 512)
