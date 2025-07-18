import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const supabaseUrl = 'https://hdnbzsfqkjyisgmggayl.supabase.co';
  static const supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhkbmJ6c2Zxa2p5aXNnbWdnYXlsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE4NDI4MTUsImV4cCI6MjA2NzQxODgxNX0.fHEnH2CaBZPgbre_kJBzy8qxhNQItVS4V9fm-ZfcjHY';

  static Future<void> initialize() async {
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  }

  static SupabaseClient get client => Supabase.instance.client;
}
