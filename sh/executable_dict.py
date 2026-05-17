#!/usr/bin/env python3
import sys
import subprocess
import json
import urllib.request
import urllib.parse

def get_clipboard_text():
    """获取剪贴板首行文本 (Wayland)"""
    try:
        result = subprocess.run(['wl-paste', '-p'], capture_output=True, text=True, timeout=1)
        if result.returncode == 0:
            return result.stdout.strip().split('\n')[0]
    except Exception:
        return None
    return None

def notify_send(title, message):
    """发送系统通知"""
    try:
        subprocess.run(['notify-send', '-t', '18000', title, message])
    except Exception:
        pass

def query_dict(word):
    """查询金山词霸 API 并提取所有释义"""
    processed_word = word.lower().strip()
    base_url = "https://dict-mobile.iciba.com/interface/index.php"
    params = {
        'c': 'word', 'm': 'getsuggest', 'nums': '5',
        'is_need_mean': '1', 'word': processed_word
    }
    url = f"{base_url}?{urllib.parse.urlencode(params)}"
    
    try:
        with urllib.request.urlopen(url, timeout=3) as response:
            data = json.loads(response.read().decode())
            messages = data.get('message', [])
            if not messages: return []

            all_defs = []
            for item in messages:
                p = item.get('paraphrase')
                if p:
                    # 将字符串按分号拆分，去空格，过滤空值
                    parts = [d.strip() for d in p.split(';') if d.strip()]
                    all_defs.extend(parts)
            
            # 使用字典去重并保持 API 返回的原始顺序
            return list(dict.fromkeys(all_defs))
    except Exception:
        return []

def main():
    # 1. 获取输入
    raw_input = sys.argv[1] if len(sys.argv) > 1 else get_clipboard_text()
    if not raw_input: return

    # 2. 获取释义列表 (List[str])
    defs = query_dict(raw_input)

    if defs:
        if sys.stdout.isatty():
            # --- 终端输出逻辑 ---
            print(f"\n\033[1;36m ❯ {raw_input}\033[0m")
            # 直接遍历列表，不再进行 split
            for item in defs:
                print(f"    {item}")
            print("")
        else:
            # --- 通知栏逻辑 ---
            full_def_text = "\n".join(defs)
            notify_send(raw_input, full_def_text)
    else:
        error_msg = "Definition not found"
        if sys.stdout.isatty():
            print(f"\033[1;31m {error_msg}\033[0m")
        else:
            notify_send(raw_input, error_msg)

if __name__ == "__main__":
    main()
