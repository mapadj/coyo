PGDMP                         y           coyo    12.6    13.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16456    coyo    DATABASE     X   CREATE DATABASE coyo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE coyo;
                root    false            �            1259    16466 
   coyo_users    TABLE     �   CREATE TABLE public.coyo_users (
    id integer NOT NULL,
    name character varying,
    email character varying,
    last_login timestamp without time zone
);
    DROP TABLE public.coyo_users;
       public         heap    root    false            �            1259    16464    coyo_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.coyo_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.coyo_users_id_seq;
       public          root    false    204            �           0    0    coyo_users_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.coyo_users_id_seq OWNED BY public.coyo_users.id;
          public          root    false    203            �            1259    16457    schema_migrations    TABLE     c   CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         heap    root    false                       2604    16469    coyo_users id    DEFAULT     n   ALTER TABLE ONLY public.coyo_users ALTER COLUMN id SET DEFAULT nextval('public.coyo_users_id_seq'::regclass);
 <   ALTER TABLE public.coyo_users ALTER COLUMN id DROP DEFAULT;
       public          root    false    204    203    204            �          0    16466 
   coyo_users 
   TABLE DATA           A   COPY public.coyo_users (id, name, email, last_login) FROM stdin;
    public          root    false    204   �       �          0    16457    schema_migrations 
   TABLE DATA           ;   COPY public.schema_migrations (version, dirty) FROM stdin;
    public          root    false    202   �       �           0    0    coyo_users_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.coyo_users_id_seq', 40, true);
          public          root    false    203                       2606    16474    coyo_users coyo_users_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.coyo_users
    ADD CONSTRAINT coyo_users_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.coyo_users DROP CONSTRAINT coyo_users_pkey;
       public            root    false    204                       2606    16461 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public            root    false    202            �   �  x��V�n�8=S_�0�M��Yiw�30J�m����d>�OsˏMQJ2q��aR�Z^�2C�Z�_yӡ�L+���fC*�"NY>��s��BȂ�$˳��+e�kjd�%%\;�j�M��Ӽ��P�"�N~j��u��>}pzǊ'����B0��8��Nm��Y�6p#K��{��)�Px�a�
J�bt�M����Z�-F�4A:�!|��R��I��{��x�i�����T�7�v�=
�G?Y��)f���BJ��q��k����T���A"�A��p(�lx�o��>'����꽩�x�+�*L�J�Wd^Ĳ�)�e1��V �ک���jUj�|�$o�ysALx�Y��r�e16���Z�q�U<")dL���i��ެ5�_ݽS�Aq�u��0����drh�녲F�km�Gi�߃�fC�%���<k��g��ԕx�c���S���ә�v��̫r'y���x�F,F'�Nf�����xe��5)����!�B�D$P�}u+e��A�*�^����(~X��:U*|�<�� �r�ghnZ@�~��iB��[�O� � �B9�@CgϿ�n!|�����c�1�
)
�HNY�)�6�J����΁�Q&�(���/0	O�8#1�C� �R�K�;P�]�ؾǳ��Lc"�h����zT�QqZj�m��ll�A�9p���$PA�7 �$ ҴUU?������ƈ�<���G�����::L;�P����`c`/���?n�����@�N�������з�ռ����e�'|���p%��9\��@�,���n�f@�=L��F�A:��7�t�*�|�<�SM�������@�]P��Z9����D�(��<����d1���/�?��rPL��`�d�$dgq$(�Q��Ry�~l5D�x���`a�-��&Fؒ.\��0;���1��{|1�G�?��@����������j���4/��N$ v�\�zk�צ? �tG��ɰ�S��D�~w�ۨJ�[�@��S�C2�JHʡ� D�tר_z(�Y��OA	KP��$��*{+)��8	C�2	������Ȁ�HZ�ƀ9'��JR	���6Q���k����A"�AڧPp�f��4�G�f���\[k�0��u���\�0���s͇�$l'�=���DQ�/_}�      �      x�3�L����� �S     