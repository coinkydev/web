import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as web;

import '../i18n/i18n.dart';

/// Contact Form component rendered on the #form page.
/// Opens default mail client targeting coinky.dev@gmail.com.
@client
class FormSection extends StatefulComponent {
  const FormSection({super.key});

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  String _topic = 'bug';
  String _message = '';

  void _handleSubmit(web.Event event) {
    event.preventDefault();

    String topicLabel;
    switch (_topic) {
      case 'feature':
        topicLabel = 'Feature Request';
        break;
      case 'question':
        topicLabel = 'Question';
        break;
      case 'other':
        topicLabel = 'Other';
        break;
      case 'bug':
      default:
        topicLabel = 'Bug Report';
        break;
    }

    final subject = Uri.encodeComponent('[Coinky Support] $topicLabel');
    final body = Uri.encodeComponent(_message);
    final mailtoUrl = 'mailto:coinky.dev@gmail.com?subject=$subject&body=$body';

    if (kIsWeb) {
      web.window.location.href = mailtoUrl;
    }

    final target = event.target as web.HTMLFormElement?;
    target?.reset();

    setState(() {
      _topic = 'bug';
      _message = '';
    });
  }

  @override
  Component build(BuildContext context) {
    final lang = I18nScope.of(context).lang;

    final title = lang == 'pt'
        ? 'Fale Conosco'
        : (lang == 'es' ? 'Contacto' : 'Contact Us');
    final backText = lang == 'pt'
        ? 'Voltar para a página inicial'
        : (lang == 'es' ? 'Volver al inicio' : 'Back to home');
    final topicLabel = lang == 'pt'
        ? 'Assunto / Categoria'
        : (lang == 'es' ? 'Asunto / Categoría' : 'Subject / Category');
    final messageLabel = lang == 'pt'
        ? 'Descreva a sua mensagem ou problema'
        : (lang == 'es' ? 'Describa su mensaje o problema' : 'Describe the issue or message');
    final submitText = lang == 'pt'
        ? 'Enviar por E-mail'
        : (lang == 'es' ? 'Enviar por Correo' : 'Send via E-mail');

    return section(id: 'form', classes: 'privacy-section', [
      div(classes: 'container privacy-container', [
        div(classes: 'privacy-card glass-card', [
          div(classes: 'privacy-header', [
            a(
              href: '#',
              classes: 'back-link',
              onClick: () {
                if (kIsWeb) {
                  web.window.location.hash = '';
                }
              },
              [
                .text('← '),
                .text(backText),
              ],
            ),
            h1(classes: 'privacy-title', [
              .text(title),
            ]),
          ]),
          form(
            classes: 'custom-contact-form',
            events: {'submit': _handleSubmit},
            [
              div(classes: 'form-group', [
                label(classes: 'form-label', [.text('$topicLabel *')]),
                select(
                  classes: 'form-control',
                  value: _topic,
                  onChange: (values) {
                    if (values.isNotEmpty) {
                      setState(() => _topic = values.first);
                    }
                  },
                  [
                    option(
                      value: 'bug',
                      [.text(lang == 'pt' ? 'Relato de Bug' : (lang == 'es' ? 'Reporte de Error' : 'Bug Report'))],
                    ),
                    option(
                      value: 'feature',
                      [.text(lang == 'pt' ? 'Sugestão de Recurso' : (lang == 'es' ? 'Sugerencia de Función' : 'Feature Request'))],
                    ),
                    option(
                      value: 'question',
                      [.text(lang == 'pt' ? 'Dúvida' : (lang == 'es' ? 'Consulta' : 'Question'))],
                    ),
                    option(
                      value: 'other',
                      [.text(lang == 'pt' ? 'Outro' : (lang == 'es' ? 'Otro' : 'Other'))],
                    ),
                  ],
                ),
              ]),
              div(classes: 'form-group', [
                label(classes: 'form-label', [.text('$messageLabel *')]),
                textarea(
                  classes: 'form-control form-textarea',
                  attributes: {'required': 'true', 'rows': '6', 'placeholder': lang == 'pt' ? 'Escreva aqui...' : 'Type here...'},
                  events: {
                    'input': (web.Event event) {
                      final target = event.target as web.HTMLTextAreaElement;
                      _message = target.value;
                    }
                  },
                  [.text(_message)],
                ),
              ]),
              div(classes: 'form-actions', [
                button(
                  classes: 'btn btn-primary btn-lg',
                  type: ButtonType.submit,
                  [.text(submitText)],
                ),
              ]),
            ],
          ),
        ]),
      ]),
    ]);
  }
}
